import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:life_pattern/features/onboarding_auth/application/auth_providers.dart';

class AuthOptionsScreen extends ConsumerWidget {
  const AuthOptionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = Theme.of(context).colorScheme;
    final authState = ref.watch(authControllerProvider);
    final isLoading = authState.isLoading;

    return Scaffold(
      backgroundColor: cs.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              const Spacer(flex: 2),

              // Logo
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [cs.primary, cs.tertiary],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: cs.primary.withAlpha(70),
                      blurRadius: 20,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.auto_awesome,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              const SizedBox(height: 20),

              Text(
                'LifePattern',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: cs.onSurface,
                      letterSpacing: -0.5,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Your personal blueprint, decoded.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: cs.onSurfaceVariant,
                    ),
                textAlign: TextAlign.center,
              ),

              const Spacer(flex: 2),

              // Continue with Email
              FilledButton.icon(
                onPressed:
                    isLoading ? null : () => context.push('/auth/signup'),
                icon: const Icon(Icons.email_outlined),
                label: const Text('Continue with Email'),
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(54),
                ),
              ),
              const SizedBox(height: 12),

              // Continue with Google
              OutlinedButton.icon(
                onPressed:
                    isLoading ? null : () => _signInWithGoogle(context, ref),
                icon: _GoogleIcon(),
                label: const Text('Continue with Google'),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(54),
                  side: BorderSide(color: cs.outline),
                ),
              ),
              const SizedBox(height: 8),

              // Already have account
              TextButton(
                onPressed: isLoading ? null : () => context.push('/auth/login'),
                child: Text(
                  'Already have an account? Sign in',
                  style: TextStyle(color: cs.primary),
                ),
              ),

              const Spacer(),

              // Continue as Guest
              TextButton(
                onPressed:
                    isLoading ? null : () => _signInAsGuest(context, ref),
                child: Text(
                  'Continue as Guest',
                  style: TextStyle(color: cs.onSurfaceVariant),
                ),
              ),

              // Terms
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text.rich(
                  TextSpan(
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: cs.onSurfaceVariant,
                        ),
                    children: const [
                      TextSpan(text: 'By continuing you agree to our '),
                      TextSpan(
                        text: 'Terms',
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                      TextSpan(text: ' and '),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _signInWithGoogle(BuildContext context, WidgetRef ref) async {
    await ref.read(authControllerProvider.notifier).signInWithGoogle();
    final state = ref.read(authControllerProvider);
    if (state.hasError && context.mounted) {
      final msg = authErrorMessage(state.error!);
      // Silent if cancelled
      if (!msg.contains('cancelled')) {
        _showError(context, msg);
      }
    }
  }

  Future<void> _signInAsGuest(BuildContext context, WidgetRef ref) async {
    await ref.read(authControllerProvider.notifier).signInAnonymously();
    final state = ref.read(authControllerProvider);
    if (state.hasError && context.mounted) {
      _showError(context, authErrorMessage(state.error!));
    }
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }
}

/// Simple Google "G" icon built from text (no asset needed).
class _GoogleIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text(
      'G',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color(0xFF4285F4),
      ),
    );
  }
}
