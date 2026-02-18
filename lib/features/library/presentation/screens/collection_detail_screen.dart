import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_pattern/features/library/application/library_providers.dart';

import 'package:life_pattern/features/library/presentation/widgets/article_tile.dart';

class CollectionDetailScreen extends ConsumerWidget {
  final String collectionId;

  const CollectionDetailScreen({super.key, required this.collectionId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collectionAsync = ref.watch(contentCollectionsProvider);
    final itemsAsync = ref.watch(contentItemsProvider(collectionId));

    // Find the specific collection from the list (or fetch individually if preferred)
    // For MVP, finding in list is fine as list is small.
    final collection = collectionAsync.asData?.value
        .where((c) => c.id == collectionId)
        .firstOrNull;

    if (collection == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                collection.title,
                style: const TextStyle(
                  color: Colors.white,
                  shadows: [Shadow(color: Colors.black, blurRadius: 4)],
                ),
              ),
              background: Container(
                color:
                    _getColorForCategory(collection.category), // Fallback image
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: Text(
                collection.description,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
          itemsAsync.when(
            data: (items) {
              if (items.isEmpty) {
                return const SliverFillRemaining(
                  child: Center(child: Text('No articles yet.')),
                );
              }
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return ArticleTile(item: items[index]);
                  },
                  childCount: items.length,
                ),
              );
            },
            loading: () => const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator())),
            error: (err, stack) =>
                SliverFillRemaining(child: Center(child: Text('Error: $err'))),
          ),
        ],
      ),
    );
  }

  Color _getColorForCategory(String category) {
    switch (category) {
      case 'patterns':
        return const Color(0xFF6A11CB);
      case 'timing':
        return const Color(0xFFfd1d1d);
      case 'relationships':
        return const Color(0xFFff9a9e);
      default:
        return const Color(0xFFa18cd1);
    }
  }
}
