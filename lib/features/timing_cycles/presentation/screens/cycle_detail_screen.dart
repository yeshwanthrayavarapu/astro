import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_pattern/features/timing_cycles/application/timing_providers.dart';

import 'package:intl/intl.dart';

class CycleDetailScreen extends ConsumerWidget {
  final String cycleId;

  const CycleDetailScreen({super.key, required this.cycleId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cycle = ref.watch(cycleDetailProvider(cycleId));

    if (cycle == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Cycle Details')),
        body: const Center(child: Text('Cycle not found')),
      );
    }

    final themeColor = _getThemeColor(context, cycle.theme);
    final dateFormat = DateFormat('MMM d, yyyy');

    return Scaffold(
      appBar: AppBar(
        title: Text(cycle.title),
        backgroundColor: themeColor.withAlpha(26), // 0.1 * 255
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              color: themeColor.withAlpha(26), // 0.1 * 255
              padding: const EdgeInsets.all(24),
              width: double.infinity,
              child: Column(
                children: [
                  Icon(_getThemeIcon(cycle.theme), size: 48, color: themeColor),
                  const SizedBox(height: 16),
                  Text(
                    cycle.title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: themeColor,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${dateFormat.format(cycle.startDate)} - ${dateFormat.format(cycle.endDate)}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8),
                  Chip(
                    label: Text(cycle.theme.toUpperCase()),
                    backgroundColor: themeColor.withAlpha(51), // 0.2 * 255
                    side: BorderSide.none,
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Affirmation Card
                  if (cycle.affirmation != null)
                    Card(
                      elevation: 0,
                      color:
                          Theme.of(context).colorScheme.surfaceContainerHighest,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            const Icon(Icons.format_quote, size: 24),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                cycle.affirmation!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  const SizedBox(height: 24),

                  // What This Means
                  Text('What This Means',
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 8),
                  Text(
                    cycle.description,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(height: 1.6),
                  ),
                  const SizedBox(height: 24),

                  // Practical Suggestions
                  Text('Practical Suggestions',
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 12),
                  ...cycle.suggestions.map((s) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.check_circle,
                                size: 20, color: themeColor),
                            const SizedBox(width: 12),
                            Expanded(
                                child: Text(s,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge)),
                          ],
                        ),
                      )),

                  const SizedBox(height: 32),

                  // Remind Me Button
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: () {
                        // TODO: Implement notification
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Notification scheduled (Mock)')),
                        );
                      },
                      icon: const Icon(Icons.notifications_active),
                      label: const Text('Remind Me of This Cycle'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getThemeColor(BuildContext context, String theme) {
    switch (theme) {
      case 'relationships':
        return Colors.pink;
      case 'career':
        return Colors.blue;
      case 'personal_growth':
        return Colors.purple;
      case 'health':
        return Colors.green;
      case 'creativity':
        return Colors.orange;
      default:
        return Theme.of(context).colorScheme.primary;
    }
  }

  IconData _getThemeIcon(String theme) {
    switch (theme) {
      case 'relationships':
        return Icons.favorite;
      case 'career':
        return Icons.work;
      case 'personal_growth':
        return Icons.landscape;
      case 'health':
        return Icons.spa;
      case 'creativity':
        return Icons.palette;
      default:
        return Icons.star;
    }
  }
}
