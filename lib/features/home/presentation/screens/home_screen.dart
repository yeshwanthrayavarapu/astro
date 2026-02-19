import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_pattern/features/blueprint/presentation/widgets/profile_header.dart';
import 'package:life_pattern/features/onboarding_auth/application/auth_providers.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    final user = authState.value;

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
                child: Column(
                  children: [
                    ProfileHeader(
                      name: user?.displayName ?? 'Traveler',
                      type: 'Cosmic Explorer',
                      avatarUrl: user?.photoURL,
                    ),
                    const SizedBox(height: 32),
                    _DailyInsights(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _DailyInsights(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Daily Insights',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontFamily: 'Serif',
              ),
        ),
        const SizedBox(height: 16),
        _InsightCard(
          title: 'Focus',
          description:
              'Today calls for introspection. Take a moment to reflect on your recent growth.',
          icon: Icons.lightbulb_outline,
          color: Colors.amber,
        ),
        const SizedBox(height: 12),
        _InsightCard(
          title: 'Vitality',
          description:
              'Energy levels are high. perfect for tackling challenging tasks or workouts.',
          icon: Icons.bolt,
          color: Colors.orange,
        ),
        const SizedBox(height: 12),
        _InsightCard(
          title: 'Connection',
          description:
              'Reach out to a close friend. The stars favor deep conversations today.',
          icon: Icons.favorite_border,
          color: Colors.pink,
        ),
      ],
    );
  }
}

class _InsightCard extends StatelessWidget {
  const _InsightCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });

  final String title;
  final String description;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey.shade600,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
