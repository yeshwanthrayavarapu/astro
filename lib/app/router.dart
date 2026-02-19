import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:life_pattern/app/widgets/app_scaffold.dart';
import 'package:life_pattern/features/birth_profile/application/profile_providers.dart';
import 'package:life_pattern/features/birth_profile/domain/profile.dart'; // Added import for Profile type
import 'package:life_pattern/features/birth_profile/presentation/screens/birth_data_form_screen.dart';
import 'package:life_pattern/features/birth_profile/presentation/screens/profile_confirm_screen.dart';
import 'package:life_pattern/features/birth_profile/presentation/screens/profile_welcome_screen.dart';
import 'package:life_pattern/features/bonds/presentation/screens/bond_detail_screen.dart';
import 'package:life_pattern/features/bonds/presentation/screens/bonds_screen.dart';
import 'package:life_pattern/features/bonds/presentation/screens/create_bond_screen.dart';
import 'package:life_pattern/features/library/presentation/screens/article_reader_screen.dart';
import 'package:life_pattern/features/library/presentation/screens/collection_detail_screen.dart';
import 'package:life_pattern/features/library/presentation/screens/library_home_screen.dart';
import 'package:life_pattern/features/onboarding_auth/application/auth_providers.dart';
import 'package:life_pattern/features/onboarding_auth/presentation/screens/auth_options_screen.dart';
import 'package:life_pattern/features/onboarding_auth/presentation/screens/forgot_password_screen.dart';
import 'package:life_pattern/features/onboarding_auth/presentation/screens/login_screen.dart';
import 'package:life_pattern/features/onboarding_auth/presentation/screens/onboarding_screen.dart';
import 'package:life_pattern/features/onboarding_auth/presentation/screens/signup_screen.dart';
import 'package:life_pattern/features/onboarding_auth/presentation/screens/splash_screen.dart';
import 'package:life_pattern/features/blueprint/presentation/screens/blueprint_screen.dart';
import 'package:life_pattern/features/blueprint/presentation/screens/pattern_detail_screen.dart';
import 'package:life_pattern/features/timing_cycles/presentation/screens/cycle_detail_screen.dart';
import 'package:life_pattern/features/timing_cycles/presentation/screens/timing_screen.dart';
import 'package:life_pattern/features/settings/presentation/screens/settings_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ---------------------------------------------------------------------------
// Home screen
// ---------------------------------------------------------------------------

import 'package:life_pattern/features/home/presentation/screens/home_screen.dart';

// ---------------------------------------------------------------------------
// Router provider
// ---------------------------------------------------------------------------

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  // Use a ValueNotifier<int> to trigger redirects without recreating the Router
  final notifier = ValueNotifier<int>(0);

  // Listen to providers and notify router to refresh by incrementing counter
  ref.listen<AsyncValue<User?>>(authStateProvider, (_, __) => notifier.value++);
  ref.listen<AsyncValue<Profile?>>(
      profileProvider, (_, __) => notifier.value++);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/splash',
    debugLogDiagnostics: true,
    refreshListenable: notifier, // Trigger redirects on provider updates
    redirect: (context, state) async {
      final location = state.uri.toString();

      // Read values (do not watch)
      final authState = ref.read(authStateProvider);
      final profileAsync = ref.read(profileProvider);

      // Routes that never trigger a redirect
      const publicRoutes = [
        '/splash',
        '/onboarding',
        '/auth/options',
        '/auth/signup',
        '/auth/login',
        '/auth/forgot-password',
      ];
      const profileRoutes = [
        '/profile/welcome',
        '/profile/form',
        '/profile/confirm',
      ];

      final isPublic = publicRoutes.any((r) => location.startsWith(r));
      final isProfileRoute = profileRoutes.any((r) => location.startsWith(r));

      // 1. Auth Loading: only block if we have NO data yet
      if (authState.isLoading && !authState.hasValue) {
        return location == '/splash' ? null : '/splash';
      }

      // Check for auth error or data
      if (authState.hasError) {
        // Simple error handling: stay on splash or go to onboarding?
        // Let's assume error means "not logged in" or "network issue"
        // For now, if we are on splash, maybe go to onboarding?
        // Or if we have no user, treat as null.
        // Let's proceed to check existing value or treat as null.
      }

      final User? user = authState.asData?.value;

      // 2. Not authenticated
      if (user == null) {
        // If we are on public route (BUT NOT SPLASH), stay there.
        // If we are on splash, we must move to onboarding/auth.
        if (isPublic && location != '/splash') return null;

        // Check if onboarding was seen
        final prefs = await SharedPreferences.getInstance();
        final seen = prefs.getBool('onboarding_seen') ?? false;
        return seen ? '/auth/options' : '/onboarding';
      }

      // 3. Authenticated

      // If we are on a public route, we need to decide where to go (Profile or App)
      if (isPublic) {
        // Profile Loading: only block if NO data
        if (profileAsync.isLoading && !profileAsync.hasValue) {
          // If on splash, stay on splash. If on other public route, maybe stay there?
          // If on splash, we return null (stay) or specifically '/splash'
          return location == '/splash' ? null : '/splash';
        }

        final hasProfile = profileAsync.asData?.value != null;

        // If on splash, we MUST redirect
        if (location == '/splash') {
          return hasProfile ? '/home' : '/profile/welcome';
        }

        // If on other public pages (login etc), redirect to home if logged in
        return hasProfile ? '/home' : '/profile/welcome';
      }

      // If on a profile route, allow it (unless we want to kick them out if profile exists?)
      if (isProfileRoute) {
        // Optional: if profile exists, maybe redirect to home?
        // But user might be editing. Let's allowing staying.
        return null;
      }

      // 4. Main App Route (Protected)
      // Check if profile is missing
      if (!profileAsync.isLoading || profileAsync.hasValue) {
        final hasProfile = profileAsync.asData?.value != null;
        if (!hasProfile) return '/profile/welcome';
      }

      return null;
    },
    routes: [
      // Splash
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),

      // Onboarding
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),

      // Auth routes
      GoRoute(
        path: '/auth/options',
        builder: (context, state) => const AuthOptionsScreen(),
      ),
      GoRoute(
        path: '/auth/signup',
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: '/auth/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/auth/forgot-password',
        builder: (context, state) => const ForgotPasswordScreen(),
      ),

      // Profile setup routes
      GoRoute(
        path: '/profile/welcome',
        builder: (context, state) => const ProfileWelcomeScreen(),
      ),
      GoRoute(
        path: '/profile/form',
        builder: (context, state) => const BirthDataFormScreen(),
      ),
      GoRoute(
        path: '/profile/confirm',
        builder: (context, state) {
          final data = state.extra;
          if (data is! BirthFormData) {
            // extra is null or wrong type (e.g. after hot-restart / deep-link)
            // Redirect back to the form so the user can fill it in again.
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (context.mounted) context.go('/profile/form');
            });
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          return ProfileConfirmScreen(data: data);
        },
      ),

      // Full-screen / Overlay routes (Siblings of ShellRoute)
      GoRoute(
        path: '/settings',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/bonds/create',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const CreateBondScreen(),
      ),
      GoRoute(
        path: '/library/article/:id',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return ArticleReaderScreen(itemId: id);
        },
      ),

      // Main app — shell with persistent bottom nav
      ShellRoute(
        builder: (context, state, child) => AppScaffold(child: child),
        routes: [
          GoRoute(
            path: '/home',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: HomeScreen()),
          ),
          GoRoute(
            path: '/blueprint',
            builder: (context, state) => const BlueprintScreen(),
            routes: [
              GoRoute(
                path: 'detail/:id',
                builder: (context, state) {
                  final id = state.pathParameters['id']!;
                  return PatternDetailScreen(patternId: id);
                },
              ),
            ],
          ),
          GoRoute(
            path: '/timing',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: TimingScreen()),
            routes: [
              GoRoute(
                path: 'detail/:id',
                builder: (context, state) {
                  final id = state.pathParameters['id']!;
                  return CycleDetailScreen(cycleId: id);
                },
              ),
            ],
          ),
          GoRoute(
            path: '/bonds',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: BondsScreen()),
            routes: [
              GoRoute(
                path: 'detail/:id',
                builder: (context, state) {
                  final id = state.pathParameters['id']!;
                  return BondDetailScreen(bondId: id);
                },
              ),
            ],
          ),
          GoRoute(
            path: '/library',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: LibraryHomeScreen()),
            routes: [
              GoRoute(
                path: 'collection/:id',
                builder: (context, state) {
                  final id = state.pathParameters['id']!;
                  return CollectionDetailScreen(collectionId: id);
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
