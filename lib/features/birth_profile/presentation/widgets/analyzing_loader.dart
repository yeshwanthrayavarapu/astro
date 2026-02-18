import 'package:flutter/material.dart';

class AnalyzingLoader extends StatelessWidget {
  final String? message;
  const AnalyzingLoader({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: cs.surface
          .withAlpha(240), // Slight transparency effect if used as overlay
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(
                strokeWidth: 4,
                color: cs.primary,
                backgroundColor: cs.primaryContainer,
              ),
            ),
            const SizedBox(height: 32),
            Text(
              message ?? 'Analyzing your cosmic blueprint...',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: cs.primary,
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              'Calculating planetary positions and aspects.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
