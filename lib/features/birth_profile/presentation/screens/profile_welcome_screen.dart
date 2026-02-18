import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileWelcomeScreen extends StatelessWidget {
  const ProfileWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: cs.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              const Spacer(flex: 2),

              // Illustration
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [cs.primary, cs.tertiary],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: cs.primary.withAlpha(60),
                      blurRadius: 32,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.stars_rounded,
                  size: 72,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 36),

              Text(
                'Tell Us When & Where\nYou Were Born',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      height: 1.25,
                    ),
              ),
              const SizedBox(height: 16),

              Text(
                'Your birth date, time, and place are the foundation of your personal blueprint. We use this to calculate your unique patterns, timing cycles, and relationship dynamics.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: cs.onSurfaceVariant,
                      height: 1.6,
                    ),
              ),
              const SizedBox(height: 32),

              // Why we need this
              _InfoRow(
                icon: Icons.lock_outline,
                text: 'Your data is private and never shared.',
                cs: cs,
              ),
              const SizedBox(height: 12),
              _InfoRow(
                icon: Icons.offline_bolt_outlined,
                text: 'Timezone is detected automatically — no GPS needed.',
                cs: cs,
              ),
              const SizedBox(height: 12),
              _InfoRow(
                icon: Icons.edit_outlined,
                text: 'You can update your profile at any time.',
                cs: cs,
              ),

              const Spacer(flex: 3),

              FilledButton(
                onPressed: () => context.go('/profile/form'),
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(54),
                ),
                child: const Text(
                  'Enter My Birth Data',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.text,
    required this.cs,
  });

  final IconData icon;
  final String text;
  final ColorScheme cs;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: cs.primary),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: cs.onSurfaceVariant,
                ),
          ),
        ),
      ],
    );
  }
}
