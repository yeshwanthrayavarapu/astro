import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_pattern/core/errors/app_exception.dart';
import 'package:life_pattern/features/onboarding_auth/infrastructure/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ---------------------------------------------------------------------------
// AuthService provider
// ---------------------------------------------------------------------------

final authServiceProvider = Provider<AuthService>((ref) => AuthService());

// ---------------------------------------------------------------------------
// Auth state stream — emits current Firebase User (or null)
// ---------------------------------------------------------------------------

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.watch(authServiceProvider).authStateChanges;
});

// ---------------------------------------------------------------------------
// Onboarding seen flag — reads SharedPreferences synchronously via FutureProvider
// ---------------------------------------------------------------------------

final onboardingSeenProvider = FutureProvider<bool>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('onboarding_seen') ?? false;
});

// ---------------------------------------------------------------------------
// Auth controller — handles all auth actions with loading/error state
// ---------------------------------------------------------------------------

class AuthController extends AsyncNotifier<void> {
  AuthService get _service => ref.read(authServiceProvider);

  @override
  Future<void> build() async {}

  Future<void> signUpWithEmail(
    String email,
    String password,
    String name,
    String? phoneNumber,
  ) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _service.signUpWithEmail(email, password, name, phoneNumber),
    );
  }

  Future<void> signInWithEmail(String email, String password) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _service.signInWithEmail(email, password),
    );
  }

  Future<void> signInWithGoogle() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_service.signInWithGoogle);
  }

  Future<void> signInAnonymously() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_service.signInAnonymously);
  }

  Future<void> completeOnboarding(String uid) async {
    // No state loading here — this is a background/silent update usually,
    // or handled by the caller's local loading state if needed.
    // But since we want to block, let's treat it as an async action if we want global loading,
    // or just await the service.
    // For now, let's just await the service without setting global auth state to loading,
    // as we are already showing "Analyzing..." from the profile controller.
    await _service.completeOnboarding(uid);
  }

  Future<void> sendPasswordResetEmail(String email) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _service.sendPasswordResetEmail(email),
    );
  }

  Future<void> signOut() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_service.signOut);
  }
}

final authControllerProvider =
    AsyncNotifierProvider<AuthController, void>(AuthController.new);

// ---------------------------------------------------------------------------
// Helper — maps AppException to user-friendly string
// ---------------------------------------------------------------------------

String authErrorMessage(Object error) {
  if (error is AuthException) return error.message;
  return 'An unexpected error occurred. Please try again.';
}
