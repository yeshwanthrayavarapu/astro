import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:life_pattern/features/birth_profile/application/profile_providers.dart';
import 'package:life_pattern/features/bonds/application/compatibility_service.dart';
import 'package:life_pattern/features/bonds/domain/bond.dart';
import 'package:life_pattern/features/bonds/domain/offline_profile.dart';
import 'package:life_pattern/features/bonds/infrastructure/bond_repository.dart';
import 'package:life_pattern/features/onboarding_auth/application/auth_providers.dart';
import 'package:uuid/uuid.dart';

// -----------------------------------------------------------------------------
// Repository & Service
// -----------------------------------------------------------------------------

final bondRepositoryProvider = Provider<BondRepository>((ref) {
  return BondRepository(firestore: FirebaseFirestore.instance);
});

final compatibilityServiceProvider = Provider<CompatibilityService>((ref) {
  return CompatibilityService();
});

// -----------------------------------------------------------------------------
// Data Providers
// -----------------------------------------------------------------------------

final bondsProvider = StreamProvider.autoDispose<List<Bond>>((ref) {
  final user = ref.watch(authStateProvider).asData?.value;
  if (user == null) return const Stream.empty();

  final repo = ref.watch(bondRepositoryProvider);
  return repo.watchBonds(user.uid);
});

final offlineProfilesProvider =
    StreamProvider.autoDispose<List<OfflineProfile>>((ref) {
  final user = ref.watch(authStateProvider).asData?.value;
  if (user == null) return const Stream.empty();

  final repo = ref.watch(bondRepositoryProvider);
  return repo.watchOfflineProfiles(user.uid);
});

final bondDetailProvider =
    Provider.family.autoDispose<Bond?, String>((ref, id) {
  final bonds = ref.watch(bondsProvider).asData?.value;
  if (bonds == null) return null;
  try {
    return bonds.firstWhere((b) => b.id == id);
  } catch (_) {
    return null;
  }
});

// -----------------------------------------------------------------------------
// Controller
// -----------------------------------------------------------------------------

final createBondControllerProvider =
    AsyncNotifierProvider<CreateBondController, void>(CreateBondController.new);

class CreateBondController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {
    // no-op
  }

  /// Create bond with offline profile
  Future<String> createWithOfflineProfile({
    required String name,
    required DateTime dob, // Time/Place optional
  }) async {
    final user = ref.read(authStateProvider).value;
    final userProfile = ref.read(profileProvider).value;

    if (user == null || userProfile == null) {
      throw Exception('User profile not found');
    }

    state = const AsyncLoading();

    try {
      final repo = ref.read(bondRepositoryProvider);
      final service = ref.read(compatibilityServiceProvider);

      // 1. Create Offline Profile
      final offlineId = const Uuid().v4();
      final offlineProfile = OfflineProfile(
        id: offlineId,
        createdByUserId: user.uid,
        name: name,
        dateOfBirth: dob,
        createdAt: DateTime.now(),
      );

      await repo.createOfflineProfile(offlineProfile);

      // 2. Calculate Compatibility (Using Profile model for user, but custom logic for offline)
      // Need adapter logic inside service or duplicate calculate methods
      // Let's use service.calculateOffline
      final scores = service.calculateOffline(userProfile, offlineProfile);
      final summary =
          "Your connection with $name is ${service.generateLabels(scores.overall).first.toLowerCase()}.";
      final dynamics = service.generateDynamics(scores.overall);

      // 3. Create Bond
      final bondId = const Uuid().v4();
      final bond = Bond(
        id: bondId,
        userId: user.uid,
        otherProfileId: offlineId,
        otherName: name,
        otherDateOfBirth: dob,
        scores: scores,
        labels: service.generateLabels(scores.overall),
        summary: summary,
        dynamics: dynamics,
        createdAt: DateTime.now(),
      );

      await repo.createBond(bond); // Then save

      state = const AsyncData(null);
      return bondId;
    } catch (e, stack) {
      state = AsyncError(e, stack);
      rethrow;
    }
  }

  // TODO: Add createWithAppUser in future
}
