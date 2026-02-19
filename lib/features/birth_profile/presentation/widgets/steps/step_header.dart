import 'package:flutter/material.dart';

class StepHeader extends StatelessWidget {
  const StepHeader({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    required this.title,
    this.subtitle,
  });

  final int currentStep;
  final int totalSteps;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        // STEP X OF Y
        Text(
          'STEP $currentStep OF $totalSteps',
          style: textTheme.labelSmall?.copyWith(
            color: const Color(0xFF6200EA), // Deep purple
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 16),

        // Progress indicators
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(totalSteps, (index) {
            // Current step is fully purple
            // Previous steps could be lighter purple or full purple?
            // Let's make current step full purple and others grey/light
            final isActive = (index + 1) == currentStep;
            final isPast = (index + 1) < currentStep;

            final color = isActive
                ? const Color(0xFF6200EA)
                : isPast
                    ? const Color(
                        0xFFB39DDB) // Light purple for completed steps
                    : const Color(0xFFE0E0E0); // Grey for future

            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 32,
              height: 4,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(2),
              ),
            );
          }),
        ),
        const SizedBox(height: 32),

        // Title
        Text(
          title,
          textAlign: TextAlign.center,
          style: textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1A1A1A),
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              subtitle!,
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium?.copyWith(
                color: const Color(0xFF7E909A),
                height: 1.5,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
