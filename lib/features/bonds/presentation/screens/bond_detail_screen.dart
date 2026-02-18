import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_pattern/features/bonds/application/bond_providers.dart';

class BondDetailScreen extends ConsumerWidget {
  final String bondId;

  const BondDetailScreen({super.key, required this.bondId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bond = ref.watch(bondDetailProvider(bondId));

    if (bond == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Bond Detail')),
        body: const Center(child: Text('Bond not found')),
      );
    }

    final theme = Theme.of(context);
    final scores = bond.scores;

    return Scaffold(
      appBar: AppBar(title: const Text('Compatibility')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Header
            CircleAvatar(
              radius: 40,
              backgroundColor: theme.colorScheme.primaryContainer,
              child: Text(
                bond.otherName.isNotEmpty ? bond.otherName[0] : '?',
                style: theme.textTheme.displaySmall,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'You & ${bond.otherName}',
              style: theme.textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              alignment: WrapAlignment.center,
              children: bond.labels
                  .map((l) => Chip(
                        label: Text(l),
                        backgroundColor: theme.colorScheme.secondaryContainer
                            .withAlpha(128), // 0.5 opacity
                      ))
                  .toList(),
            ),
            const SizedBox(height: 32),

            // Overall Score
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: CircularProgressIndicator(
                    value: scores.overall / 100,
                    strokeWidth: 12,
                    backgroundColor: theme.colorScheme.surfaceContainerHighest,
                    strokeCap: StrokeCap.round,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${scores.overall}%',
                      style: theme.textTheme.displayMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Overall',
                      style: theme.textTheme.labelMedium,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              bond.summary,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: 48),

            // Detailed Scores
            _ScoreRow(label: 'Emotional', score: scores.emotional),
            _ScoreRow(label: 'Intellectual', score: scores.intellectual),
            _ScoreRow(label: 'Communication', score: scores.communication),
            _ScoreRow(label: 'Values', score: scores.values),
            _ScoreRow(label: 'Long-Term', score: scores.longTerm),

            const SizedBox(height: 48),

            // Dynamics
            _DynamicCard(
              title: 'Strengths',
              content: bond.dynamics.strengths,
              icon: Icons.thumb_up_alt_outlined,
              color: Colors.green,
            ),
            const SizedBox(height: 16),
            _DynamicCard(
              title: 'Challenges',
              content: bond.dynamics.challenges,
              icon: Icons.warning_amber_rounded,
              color: Colors.orange,
            ),
            const SizedBox(height: 16),
            _DynamicCard(
              title: 'Advice',
              content: bond.dynamics.advice,
              icon: Icons.lightbulb_outline,
              color: theme.colorScheme.primary,
            ),

            const SizedBox(height: 32),
            // Tips
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Tips', style: theme.textTheme.titleLarge),
            ),
            const SizedBox(height: 8),
            ...bond.dynamics.tips.map((t) => ListTile(
                  leading: const Icon(Icons.check),
                  title: Text(t),
                  contentPadding: EdgeInsets.zero,
                )),
            const SizedBox(height: 32),

            OutlinedButton.icon(
              onPressed: () {
                // Delete bond (future impl)
              },
              icon: const Icon(Icons.delete_outline),
              label: const Text('Remove Connection'),
              style: OutlinedButton.styleFrom(
                foregroundColor: theme.colorScheme.error,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScoreRow extends StatelessWidget {
  final String label;
  final int score;

  const _ScoreRow({required this.label, required this.score});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: Theme.of(context).textTheme.bodyMedium),
              Text('$score%',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: score / 100,
            minHeight: 8,
            borderRadius: BorderRadius.circular(4),
            backgroundColor:
                Theme.of(context).colorScheme.surfaceContainerHighest,
          ),
        ],
      ),
    );
  }
}

class _DynamicCard extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;
  final Color color;

  const _DynamicCard({
    required this.title,
    required this.content,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color:
          Theme.of(context).colorScheme.surfaceContainerHighest.withAlpha(128),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(content),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
