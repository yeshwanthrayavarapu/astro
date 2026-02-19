import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:life_pattern/features/onboarding_auth/application/auth_providers.dart';

class AuthOptionsScreen extends ConsumerWidget {
  const AuthOptionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);
    final isLoading = authState.isLoading;

    // Dark background gradient
    const backgroundGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFF1A1B2F), // Dark blue-black
        Color(0xFF121212), // Almost black
      ],
    );

    return Scaffold(
      body: Stack(
        children: [
          // Background
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(gradient: backgroundGradient),
            ),
          ),

          // Centered Card Content
          SizedBox.expand(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(maxWidth: 400),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.25),
                        blurRadius: 24,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Logo (Lotus simulation)
                      Container(
                        width: 80,
                        height: 80,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF3E5F5), // Light lavender
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: const Icon(
                          Icons.spa_rounded, // Lotus-like icon
                          color: Color(0xFF7E57C2), // Deep purple
                          size: 40,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Title
                      const Text(
                        'Start your journey of\nself-discovery',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Serif',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A1A1A),
                          letterSpacing: -0.5,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Subtitle
                      const Text(
                        'Join LifePattern today',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF7E909A),
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Buttons
                      // Continue with Google
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: FilledButton.icon(
                          onPressed: isLoading
                              ? null
                              : () => _signInWithGoogle(context, ref),
                          icon: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const _GoogleIcon(size: 16),
                          ),
                          label: const Text(
                            'Continue with Google',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          style: FilledButton.styleFrom(
                            backgroundColor:
                                const Color(0xFF6200EA), // Deep purple
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(26),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Continue with Email
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: OutlinedButton.icon(
                          onPressed: isLoading
                              ? null
                              : () => context.push('/auth/signup'),
                          icon: const Icon(Icons.email_outlined, size: 20),
                          label: const Text(
                            'Continue with email',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            backgroundColor:
                                const Color(0xFFF5F7FA), // Very light grey
                            side: BorderSide(
                                color: Colors.grey.shade300, width: 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(26),
                            ),
                            overlayColor: Colors.grey.shade300, // Splash color
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Guest
                      TextButton(
                        onPressed: isLoading
                            ? null
                            : () => _signInAsGuest(context, ref),
                        child: const Text(
                          'Continue as guest',
                          style: TextStyle(
                            color: Color(0xFF546E7A),
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Terms
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text.rich(
                          TextSpan(
                            style: const TextStyle(
                              fontSize: 11,
                              color: Color(0xFF90A4AE),
                              height: 1.4,
                            ),
                            children: const [
                              TextSpan(
                                  text: 'By continuing, you agree to our '),
                              TextSpan(
                                text: 'Terms of Service',
                                style: TextStyle(
                                  color: Color(0xFF7E57C2),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(text: ' and '),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: TextStyle(
                                  color: Color(0xFF7E57C2),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(text: '.'),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
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
  const _GoogleIcon({this.size = 18});
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      'G',
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w900,
        color: const Color(0xFF4285F4),
        fontFamily: 'sans-serif',
      ),
    );
  }
}
