import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_pattern/features/library/application/library_providers.dart';
import 'package:life_pattern/features/library/data/seeding_script.dart';
import 'package:life_pattern/features/library/presentation/widgets/collection_card.dart';

class LibraryHomeScreen extends ConsumerWidget {
  const LibraryHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collectionsAsync = ref.watch(contentCollectionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Library'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search activation
            },
          ),
        ],
      ),
      body: collectionsAsync.when(
        data: (collections) {
          if (collections.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('No collections found.'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      final repo = ref.read(contentRepositoryProvider);
                      // Seed all collections
                      for (final col in seedCollections) {
                        // Filter items for this collection
                        final items = seedItems
                            .where((i) => i.collectionId == col.id)
                            .toList();
                        await repo.seedCollection(col, items);
                      }
                      // Refresh is automatic via StreamProvider
                    },
                    child: const Text('Seed Library Content'),
                  ),
                ],
              ),
            );
          }
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: collections.length,
            itemBuilder: (context, index) {
              return CollectionCard(collection: collections[index]);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
