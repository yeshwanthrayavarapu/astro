import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_pattern/features/birth_profile/domain/profile.dart';
import 'package:life_pattern/features/birth_profile/infrastructure/profile_service.dart';
import 'package:life_pattern/features/onboarding_auth/application/auth_providers.dart';

// ---------------------------------------------------------------------------
// Service provider
// ---------------------------------------------------------------------------

final profileServiceProvider =
    Provider<ProfileService>((ref) => ProfileService());

// ---------------------------------------------------------------------------
// Current user's profile — null means not yet created
// ---------------------------------------------------------------------------

final profileProvider = FutureProvider<Profile?>((ref) async {
  final authState = ref.watch(authStateProvider);
  final User? user = authState.when(
    data: (u) => u,
    loading: () => null,
    error: (_, __) => null,
  );
  if (user == null) return null;
  return ref.read(profileServiceProvider).getProfile(user.uid);
});

// ---------------------------------------------------------------------------
// Convenience: is the profile complete?
// ---------------------------------------------------------------------------

final profileCompleteProvider = Provider<bool>((ref) {
  final profileAsync = ref.watch(profileProvider);
  return profileAsync.when(
    data: (p) => p != null,
    loading: () => false,
    error: (_, __) => false,
  );
});

// ---------------------------------------------------------------------------
// Profile controller — saves the profile and invalidates the cache
// ---------------------------------------------------------------------------

class ProfileController extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<void> saveProfile(Profile profile) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(profileServiceProvider).saveProfile(profile);
      ref.invalidate(profileProvider);
    });
  }
}

final profileControllerProvider =
    AsyncNotifierProvider<ProfileController, void>(ProfileController.new);
