import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:life_pattern/features/blueprint/application/blueprint_providers.dart';
import 'package:life_pattern/features/blueprint/domain/journal_entry.dart';
import 'package:life_pattern/features/blueprint/presentation/widgets/pattern_header_image.dart';

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
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              // 1. Hero Header
              SliverAppBar(
                expandedHeight: 200,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    template.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: [Shadow(color: Colors.black45, blurRadius: 10)],
                    ),
                  ),
                  background: const PatternHeaderImage(),
                ),
              ),

              // 2. Content Body
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Intensity Bar
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.bolt,
                                    color: Color(0xFFAB47BC)),
                                const SizedBox(width: 8),
                                Text(
                                  'Resonance Intensity',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFF1A1A1A),
                                      ),
                                ),
                                const Spacer(),
                                Text(
                                  '${userPattern.intensity.toInt()}%',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF6200EA),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: LinearProgressIndicator(
                                value: userPattern.intensity / 100,
                                backgroundColor: const Color(0xFFF3E5F5),
                                valueColor: const AlwaysStoppedAnimation(
                                  Color(0xFF6200EA),
                                ),
                                minHeight: 8,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Description
                      Text(
                        template.longDescription,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              height: 1.6,
                              color: const Color(0xFF424242),
                            ),
                      ),
                      const SizedBox(height: 40),

                      // Reflection Prompts (Styled)
                      Text(
                        'Reflect on this',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF1A1A1A),
                                ),
                      ),
                      const SizedBox(height: 16),
                      ...template.reflectionPrompts.map((prompt) => Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF3E5F5).withOpacity(0.5),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: const Color(0xFFE1BEE7),
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(Icons.psychology,
                                    color: Color(0xFF8E24AA), size: 20),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    prompt,
                                    style: const TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: Color(0xFF4A148C),
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      const SizedBox(height: 32),

                      // Journal Section header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Your Journal',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add_circle,
                                color: Color(0xFF6200EA)),
                            onPressed: () => _showAddEntryDialog(context, ref),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      if (userPattern.journalEntries.isEmpty)
                        Container(
                          padding: const EdgeInsets.all(24),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'No entries yet. Tap + to add a reflection.',
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                        )
                      else
                        ...userPattern.journalEntries.reversed
                            .map((entry) => _JournalEntryCard(entry: entry)),

                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Lock Overlay
          if (isLocked)
            Positioned.fill(
              child: Container(
                color: cs.surface.withOpacity(0.95),
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
      // Floating button alternatively (only if not locked)
      floatingActionButton: isLocked
          ? null
          : FloatingActionButton(
              onPressed: () => _showAddEntryDialog(context, ref),
              backgroundColor: const Color(0xFF6200EA),
              child: const Icon(Icons.edit, color: Colors.white),
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
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      margin: const EdgeInsets.only(bottom: 12),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              entry.content,
              style: const TextStyle(
                fontSize: 15,
                height: 1.5,
                color: Color(0xFF424242),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              DateFormat('MMM d, yyyy • h:mm a').format(entry.createdAt),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey.shade600,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
