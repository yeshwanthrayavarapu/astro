import 'package:flutter/material.dart';
import 'package:life_pattern/features/library/domain/content_collection.dart';
import 'package:go_router/go_router.dart';

class CollectionCard extends StatelessWidget {
  final ContentCollection collection;

  const CollectionCard({super.key, required this.collection});

  @override
  Widget build(BuildContext context) {
    // Determine gradient based on category or just a default
    final Gradient gradient = _getGradient(collection.category);

    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () {
          context.push('/library/collection/${collection.id}');
        },
        child: Container(
          decoration: BoxDecoration(gradient: gradient),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Title and Description Overlay
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.7),
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      collection.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      collection.description,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.white.withOpacity(0.9),
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Gradient _getGradient(String category) {
    switch (category) {
      case 'patterns':
        return const LinearGradient(
          colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case 'timing':
        return const LinearGradient(
          colors: [Color(0xFFfd1d1d), Color(0xFFfcb045)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case 'relationships':
        return const LinearGradient(
          colors: [Color(0xFFff9a9e), Color(0xFFfecfef)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      default:
        return const LinearGradient(
          colors: [Color(0xFFa18cd1), Color(0xFFfbc2eb)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
    }
  }
}
