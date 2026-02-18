import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:life_pattern/features/blueprint/application/blueprint_providers.dart';
import 'package:life_pattern/features/blueprint/domain/journal_entry.dart';

class PatternDetailScreen extends ConsumerWidget {
  const PatternDetailScreen({super.key, required this.patternId});

  final String patternId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detail = ref.watch(patternDetailProvider(patternId));
    final cs = Theme.of(context).colorScheme;

    if (detail == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final userPattern = detail.userPattern;
    final template = detail.template;
    final isLocked = !userPattern.isUnlocked;

    return Scaffold(
      appBar: AppBar(
        title: Text(template.title),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with intensity
                Row(
                  children: [
                    Icon(Icons.auto_awesome, color: cs.primary),
                    const SizedBox(width: 8),
                    Text(
                      'Intensity: ${userPattern.intensity.toInt()}%',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: cs.primary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Long Description
                Text(
                  template.longDescription,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        height: 1.6,
                      ),
                ),
                const SizedBox(height: 32),

                // Reflection Prompts
                Text(
                  'Reflection Prompts',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 16),
                ...template.reflectionPrompts.map((prompt) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.psychology_alt,
                              size: 18, color: cs.tertiary),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              prompt,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontStyle: FontStyle.italic,
                                    color: cs.onSurfaceVariant,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(height: 32),

                // Journal Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Your Journal',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add_circle_outline),
                      onPressed: () => _showAddEntryDialog(context, ref),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                if (userPattern.journalEntries.isEmpty)
                  Text(
                    'No entries yet. Tap + to add a reflection.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: cs.onSurfaceVariant,
                        ),
                  )
                else
                  ...userPattern.journalEntries.reversed
                      .map((entry) => _JournalEntryCard(entry: entry)),

                const SizedBox(height: 48), // Bottom padding
              ],
            ),
          ),

          // Lock Overlay
          if (isLocked)
            Positioned.fill(
              child: Container(
                color: cs.surface.withAlpha(242), // ~0.95 opacity
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.lock, size: 48, color: cs.primary),
                      const SizedBox(height: 16),
                      Text(
                        'Unlock this Insight',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'This pattern is part of the Premium collection.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 24),
                      FilledButton(
                        onPressed: () {
                          // TODO: Navigate to paywall
                        },
                        child: const Text('Upgrade to Premium'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _showAddEntryDialog(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Reflection'),
        content: TextField(
          controller: controller,
          maxLines: 5,
          minLines: 3,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Write your thoughts here...',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                ref.read(blueprintControllerProvider.notifier).addJournalEntry(
                      patternId: patternId,
                      content: controller.text,
                    );
              }
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}

class _JournalEntryCard extends StatelessWidget {
  const _JournalEntryCard({required this.entry});
  final JournalEntry entry;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              entry.content,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            Text(
              DateFormat('MMM d, yyyy • h:mm a').format(entry.createdAt),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
