import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:life_pattern/features/onboarding_auth/application/auth_providers.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Account Section
          _SettingsSection(
            title: 'Account',
            children: [
              ListTile(
                leading: const Icon(Icons.person_outline),
                title: const Text('Profile Details'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // TODO: Edit profile
                },
              ),
              ListTile(
                leading: const Icon(Icons.notifications_outlined),
                title: const Text('Notifications'),
                trailing: Switch(
                  value: true,
                  onChanged: (val) {},
                  activeTrackColor: const Color(0xFF6200EA),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Support Section
          _SettingsSection(
            title: 'Support',
            children: [
              ListTile(
                leading: const Icon(Icons.help_outline),
                title: const Text('Help Center'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text('About LifePattern'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  showAboutDialog(
                    context: context,
                    applicationName: 'LifePattern',
                    applicationVersion: '1.0.0',
                    applicationLegalese: '© 2026 Cosmic Inc.',
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Danger Zone
          _SettingsSection(
            title: 'Session',
            children: [
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text(
                  'Log Out',
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () async {
                  final confirm = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Log Out'),
                      content: const Text('Are you sure you want to log out?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: const Text('Cancel'),
                        ),
                        FilledButton(
                          onPressed: () => Navigator.pop(context, true),
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('Log Out'),
                        ),
                      ],
                    ),
                  );

                  if (confirm == true) {
                    await ref.read(authControllerProvider.notifier).signOut();
                    if (context.mounted) {
                      context.go('/auth/options');
                    }
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 48),
          Center(
            child: Text(
              'Version 1.0.0',
              style: TextStyle(color: Colors.grey.shade400),
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsSection extends StatelessWidget {
  const _SettingsSection({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 8),
          child: Text(
            title,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: const Color(0xFF6200EA),
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              for (var i = 0; i < children.length; i++) ...[
                children[i],
                if (i != children.length - 1)
                  const Divider(height: 1, indent: 56),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
