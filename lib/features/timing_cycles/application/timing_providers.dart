import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_pattern/features/onboarding_auth/application/auth_providers.dart';
import 'package:life_pattern/features/timing_cycles/domain/timing_cycle.dart';
import 'package:life_pattern/features/timing_cycles/infrastructure/timing_repository.dart';

// -----------------------------------------------------------------------------
// Repository
// -----------------------------------------------------------------------------

final timingRepositoryProvider = Provider<TimingRepository>((ref) {
  return TimingRepository(firestore: FirebaseFirestore.instance);
});

// -----------------------------------------------------------------------------
// Data Providers
// -----------------------------------------------------------------------------

/// Stream all cycles for the current user
final timingCyclesProvider = StreamProvider<List<TimingCycle>>((ref) {
  final user = ref.watch(authStateProvider).asData?.value;
  if (user == null) return const Stream.empty();

  final repo = ref.watch(timingRepositoryProvider);
  return repo.watchCycles(user.uid);
});

/// Only active cycles
final activeCyclesProvider = Provider<AsyncValue<List<TimingCycle>>>((ref) {
  final cyclesAsync = ref.watch(timingCyclesProvider);
  return cyclesAsync.whenData((cycles) {
    final now = DateTime.now();
    return cycles
        .where((c) => c.startDate.isBefore(now) && c.endDate.isAfter(now))
        .toList();
  });
});

/// Only upcoming cycles
final upcomingCyclesProvider = Provider<AsyncValue<List<TimingCycle>>>((ref) {
  final cyclesAsync = ref.watch(timingCyclesProvider);
  return cyclesAsync.whenData((cycles) {
    final now = DateTime.now();
    return cycles.where((c) => c.startDate.isAfter(now)).toList();
  });
});

/// Get specific cycle by ID
final cycleDetailProvider =
    Provider.family<TimingCycle?, String>((ref, cycleId) {
  final cycles = ref.watch(timingCyclesProvider).asData?.value;
  if (cycles == null) return null;
  try {
    return cycles.firstWhere((c) => c.id == cycleId);
  } catch (_) {
    return null;
  }
});

// -----------------------------------------------------------------------------
// Controller
// -----------------------------------------------------------------------------

final timingControllerProvider =
    AsyncNotifierProvider<TimingController, void>(TimingController.new);

class TimingController extends AsyncNotifier<void> {
  @override
  Future<void> build() async {
    // Generate cycles if needed
    final user = ref.watch(authStateProvider).asData?.value;
    if (user != null) {
      await _generateCyclesIfNeeded(user.uid);
    }
  }

  Future<void> _generateCyclesIfNeeded(String userId) async {
    final repo = ref.read(timingRepositoryProvider);
    // Placeholder birth date logic - in real app, fetch from Profile
    final birthDate = DateTime(1990, 1, 1);
    await AsyncValue.guard(() => repo.generateCyclesIfEmpty(userId, birthDate));
  }

  // Method to schedule notification (placeholder for now)
  Future<void> scheduleNotification(TimingCycle cycle) async {
    // TODO: Implement actual notification scheduling via repository or service
  }
}
