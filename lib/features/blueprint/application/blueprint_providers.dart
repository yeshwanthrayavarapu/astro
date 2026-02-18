import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_pattern/features/blueprint/domain/pattern_template.dart';
import 'package:life_pattern/features/blueprint/domain/user_pattern.dart';
import 'package:life_pattern/features/blueprint/infrastructure/blueprint_repository.dart';
import 'package:life_pattern/features/onboarding_auth/application/auth_providers.dart';

// -----------------------------------------------------------------------------
// Repository
// -----------------------------------------------------------------------------

final blueprintRepositoryProvider = Provider<BlueprintRepository>((ref) {
  return BlueprintRepository(firestore: FirebaseFirestore.instance);
});

// -----------------------------------------------------------------------------
// Data Providers
// -----------------------------------------------------------------------------

/// Loads all pattern templates (cached locally or fetched once).
final patternTemplatesProvider =
    FutureProvider<List<PatternTemplate>>((ref) async {
  final repo = ref.watch(blueprintRepositoryProvider);
  return repo.getPatternTemplates();
});

/// Streams the current user's assigned patterns.
final userPatternsProvider = StreamProvider<List<UserPattern>>((ref) {
  final user = ref.watch(authStateProvider).asData?.value;
  if (user == null) return const Stream.empty();

  final repo = ref.watch(blueprintRepositoryProvider);
  return repo.watchUserPatterns(user.uid);
});

/// Derived provider: joins UserPattern with PatternTemplate for a specific ID.
final patternDetailProvider = Provider.family<
    ({UserPattern userPattern, PatternTemplate template})?,
    String>((ref, patternId) {
  final userPatterns = ref.watch(userPatternsProvider).asData?.value;
  final templates = ref.watch(patternTemplatesProvider).asData?.value;

  if (userPatterns == null || templates == null) return null;

  try {
    final userPattern = userPatterns.firstWhere((p) => p.id == patternId);
    final template =
        templates.firstWhere((t) => t.id == userPattern.patternTemplateId);
    return (userPattern: userPattern, template: template);
  } catch (_) {
    return null;
  }
});

// -----------------------------------------------------------------------------
// Controller
// -----------------------------------------------------------------------------

final blueprintControllerProvider =
    AsyncNotifierProvider<BlueprintController, void>(BlueprintController.new);

class BlueprintController extends AsyncNotifier<void> {
  @override
  Future<void> build() async {
    // Check if we need to assign patterns on load
    final user = ref.watch(authStateProvider).asData?.value;
    if (user != null) {
      await _assignPatternsIfNeeded(user.uid);
    }
  }

  Future<void> _assignPatternsIfNeeded(String userId) async {
    final repo = ref.read(blueprintRepositoryProvider);
    // We don't want to block UI or show error for this background task usually,
    // but here we can just fire and forget or await.
    // Let's await to ensure consistency but wrap in guard to handle errors.
    await AsyncValue.guard(() => repo.assignInitialPatternsIfNeeded(userId));
  }

  Future<void> addJournalEntry({
    required String patternId,
    required String content,
  }) async {
    final user = ref.read(authStateProvider).asData?.value;
    if (user == null) return;

    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ref
        .read(blueprintRepositoryProvider)
        .addJournalEntry(
            userId: user.uid, patternId: patternId, content: content));
  }
}
