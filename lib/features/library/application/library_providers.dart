import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:life_pattern/features/library/domain/content_collection.dart';
import 'package:life_pattern/features/library/domain/content_item.dart';
import 'package:life_pattern/features/library/domain/reading_progress.dart';
import 'package:life_pattern/features/library/infrastructure/content_repository.dart';
import 'package:life_pattern/features/onboarding_auth/application/auth_providers.dart';

// -----------------------------------------------------------------------------
// Repository Provider
// -----------------------------------------------------------------------------

final contentRepositoryProvider = Provider<ContentRepository>((ref) {
  return ContentRepository(firestore: FirebaseFirestore.instance);
});

// -----------------------------------------------------------------------------
// Data Streams
// -----------------------------------------------------------------------------

final contentCollectionsProvider =
    StreamProvider<List<ContentCollection>>((ref) {
  final repo = ref.watch(contentRepositoryProvider);
  return repo.watchCollections();
});

final contentItemsProvider =
    StreamProvider.family<List<ContentItem>, String>((ref, collectionId) {
  final repo = ref.watch(contentRepositoryProvider);
  return repo.watchCollectionItems(collectionId);
});

final readingProgressProvider =
    StreamProvider.family<ReadingProgress?, String>((ref, itemId) {
  final user = ref.watch(authStateProvider).asData?.value;
  if (user == null) return const Stream.empty();

  final repo = ref.watch(contentRepositoryProvider);
  return repo.watchReadingProgress(user.uid, itemId);
});

// -----------------------------------------------------------------------------
// Search Logic
// -----------------------------------------------------------------------------

final searchQueryProvider =
    NotifierProvider<SearchQueryNotifier, String>(SearchQueryNotifier.new);

class SearchQueryNotifier extends Notifier<String> {
  @override
  String build() => '';

  void set(String query) => state = query;
}

// Returns ALL items dependent on search query.
// Note: This is a client-side filter for MVP.
// For production with many items, use Algolia/Typesense.
final searchResultsProvider = FutureProvider<List<ContentItem>>((ref) async {
  final query = ref.watch(searchQueryProvider).toLowerCase();

  // If empty, return nothing (or could return featured items)
  if (query.isEmpty) return [];

  // We need to fetch ALL items to filter them.
  // In a real app, we'd do this via a specialized Firestore query or text search service.
  // For now, we'll fetch collections then fetch items for each (or just query `content_items` collection group if we had it set up).
  // Optimized approach for MVP: Query 'content_items' collection directly.
  final firestore = FirebaseFirestore.instance;
  final snapshot = await firestore.collection('content_items').get();
  final allItems =
      snapshot.docs.map((d) => ContentItem.fromJson(d.data())).toList();

  return allItems.where((item) {
    final titleMatch = item.title.toLowerCase().contains(query);
    final tagsMatch =
        item.tags?.any((t) => t.toLowerCase().contains(query)) ?? false;
    return titleMatch || tagsMatch;
  }).toList();
});

// -----------------------------------------------------------------------------
// Reading Progress Controller
// -----------------------------------------------------------------------------

final readingProgressControllerProvider =
    Provider<ReadingProgressController>((ref) {
  return ReadingProgressController(ref);
});

class ReadingProgressController {
  final Ref _ref;

  ReadingProgressController(this._ref);

  Future<void> updateProgress({
    required String itemId,
    required double percent, // 0.0 to 1.0
  }) async {
    final user = _ref.read(authStateProvider).asData?.value;
    if (user == null) return;

    final repo = _ref.read(contentRepositoryProvider);

    // Check if valid percent
    final clampedPercent = percent.clamp(0.0, 1.0);
    final isComplete = clampedPercent >= 0.95; // Mark complete at 95%

    final progress = ReadingProgress(
      userId: user.uid,
      contentItemId: itemId,
      progressPercent: clampedPercent,
      lastReadAt: DateTime.now(),
      completed: isComplete,
    );

    await repo.updateReadingProgress(progress);
  }
}
