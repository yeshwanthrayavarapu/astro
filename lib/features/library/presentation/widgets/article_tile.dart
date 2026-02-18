import 'package:flutter/material.dart';
import 'package:life_pattern/features/library/domain/content_item.dart';
import 'package:go_router/go_router.dart';

class ArticleTile extends StatelessWidget {
  final ContentItem item;

  const ArticleTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: item.isPremium
          ? const Icon(Icons.lock, color: Colors.amber)
          : const Icon(Icons.article_outlined, color: Colors.blueGrey),
      title: Text(
        item.title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.subtitle, maxLines: 1, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 4),
          Text(
            '${item.readTimeMinutes} min read',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        context.push('/library/article/${item.id}');
      },
    );
  }
}
