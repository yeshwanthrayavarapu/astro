import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:life_pattern/features/birth_profile/application/profile_providers.dart';
import 'package:life_pattern/features/birth_profile/domain/profile.dart';
import 'package:life_pattern/features/birth_profile/presentation/screens/birth_data_form_screen.dart';
import 'package:life_pattern/features/birth_profile/presentation/widgets/analyzing_loader.dart';
import 'package:life_pattern/features/onboarding_auth/application/auth_providers.dart';

class ProfileConfirmScreen extends ConsumerWidget {
  const ProfileConfirmScreen({super.key, required this.data});

  final BirthFormData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // If saving, show the full-screen loader
    final isLoading = ref.watch(profileControllerProvider).isLoading;
    if (isLoading) {
      return const AnalyzingLoader();
    }

    final cs = Theme.of(context).colorScheme;

    final timeLabel = data.timeUnknown
        ? 'Unknown (using noon)'
        : TimeOfDay(hour: data.birthHour, minute: data.birthMinute)
            .format(context);

    final genderLabel = _labelFor(data.gender, {
      'male': 'Male',
      'female': 'Female',
      'other': 'Other',
      'prefer_not': 'Prefer not to say',
    });

    final relationshipLabel = _labelFor(data.relationshipStatus, {
      'single': 'Single',
      'in_relationship': 'In a Relationship',
      'married': 'Married',
      'complicated': "It's Complicated",
      'prefer_not': 'Prefer not to say',
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm Your Data'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Does everything look right?',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                'You can always update this later in your profile settings.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: cs.onSurfaceVariant,
                    ),
              ),
              const SizedBox(height: 24),

              // Summary card
              Card(
                elevation: 0,
                color: cs.surfaceContainerLow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: cs.outlineVariant),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      _DataRow(
                        icon: Icons.cake_outlined,
                        label: 'Date of Birth',
                        value:
                            DateFormat('MMMM d, yyyy').format(data.dateOfBirth),
                        cs: cs,
                      ),
                      _Divider(cs: cs),
                      _DataRow(
                        icon: Icons.schedule_outlined,
                        label: 'Time of Birth',
                        value: timeLabel,
                        cs: cs,
                      ),
                      _Divider(cs: cs),
                      _DataRow(
                        icon: Icons.place_outlined,
                        label: 'Place of Birth',
                        value: data.placeName,
                        cs: cs,
                      ),
                      _Divider(cs: cs),
                      _DataRow(
                        icon: Icons.public,
                        label: 'Timezone',
                        value: data.timezone,
                        cs: cs,
                      ),
                      if (genderLabel != null) ...[
                        _Divider(cs: cs),
                        _DataRow(
                          icon: Icons.person_outline,
                          label: 'Gender',
                          value: genderLabel,
                          cs: cs,
                        ),
                      ],
                      if (relationshipLabel != null) ...[
                        _Divider(cs: cs),
                        _DataRow(
                          icon: Icons.favorite_border,
                          label: 'Relationship',
                          value: relationshipLabel,
                          cs: cs,
                        ),
                      ],
                    ],
                  ),
                ),
              ),

              const Spacer(),

              // Confirm button
              FilledButton(
                onPressed: () => _save(context, ref),
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(54),
                ),
                child: const Text(
                  'Looks Good — Save My Profile',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 12),

              // Edit button
              OutlinedButton(
                onPressed: () => context.pop(),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(48),
                ),
                child: const Text('Edit'),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _save(BuildContext context, WidgetRef ref) async {
    final authState = ref.read(authStateProvider);
    final User? user = authState.when(
      data: (u) => u,
      loading: () => null,
      error: (_, __) => null,
    );
    if (user == null) return;

    final now = DateTime.now();
    final profile = Profile(
      userId: user.uid,
      dateOfBirth: data.dateOfBirth,
      birthHour: data.birthHour,
      birthMinute: data.birthMinute,
      timeUnknown: data.timeUnknown,
      placeName: data.placeName,
      latitude: data.latitude,
      longitude: data.longitude,
      timezone: data.timezone,
      gender: data.gender,
      relationshipStatus: data.relationshipStatus,
      createdAt: now,
    );

    await ref.read(profileControllerProvider.notifier).saveProfile(profile);

    final state = ref.read(profileControllerProvider);
    if (!state.hasError) {
      // Profile saved → mark onboarding as complete
      await ref
          .read(authControllerProvider.notifier)
          .completeOnboarding(user.uid);

      if (context.mounted) {
        context.go('/home');
      }
    } else if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.error.toString()),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }

  String? _labelFor(String? key, Map<String, String> map) {
    if (key == null) return null;
    return map[key];
  }
}

// ---------------------------------------------------------------------------
// Helper widgets
// ---------------------------------------------------------------------------

class _DataRow extends StatelessWidget {
  const _DataRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.cs,
  });

  final IconData icon;
  final String label;
  final String value;
  final ColorScheme cs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: cs.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: cs.onSurfaceVariant,
                      ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
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

class _Divider extends StatelessWidget {
  const _Divider({required this.cs});
  final ColorScheme cs;

  @override
  Widget build(BuildContext context) {
    return Divider(height: 1, color: cs.outlineVariant);
  }
}
