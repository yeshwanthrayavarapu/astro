import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
import 'package:life_pattern/features/timing_cycles/presentation/screens/timing_screen.dart'; // Correct import
import 'package:shared_preferences/shared_preferences.dart';

// ---------------------------------------------------------------------------
// Home screen
// ---------------------------------------------------------------------------

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LifePattern')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.home,
                size: 64, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 16),
            Text('Coming soon: Home Feed',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(
              'Your daily personality insights and cosmic overview.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

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

      // While auth is loading, stay on splash
      if (authState.isLoading) {
        return location == '/splash' ? null : '/splash';
      }

      final User? user = authState.when(
        data: (u) => u,
        loading: () => null,
        error: (_, __) => null,
      );

      // Not authenticated → public flow
      if (user == null) {
        if (isPublic) return null;
        final prefs = await SharedPreferences.getInstance();
        final seen = prefs.getBool('onboarding_seen') ?? false;
        return seen ? '/auth/options' : '/onboarding';
      }

      // Authenticated but on a public route → check profile
      if (isPublic) {
        // Profile still loading → let splash handle it
        if (profileAsync.isLoading) return '/splash';
        final hasProfile = profileAsync.when(
          data: (p) => p != null,
          loading: () => false,
          error: (_, __) => false,
        );
        return hasProfile ? '/home' : '/profile/welcome';
      }

      // Authenticated, on a profile route → allow
      if (isProfileRoute) return null;

      // Authenticated, on a main app route → check profile is complete
      if (!profileAsync.isLoading) {
        final hasProfile = profileAsync.when(
          data: (p) => p != null,
          loading: () => true, // optimistic — don't flash redirect
          error: (_, __) => true,
        );
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
          final data = state.extra as BirthFormData;
          return ProfileConfirmScreen(data: data);
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
                path: 'create',
                parentNavigatorKey: _rootNavigatorKey, // Full screen modal
                builder: (context, state) => const CreateBondScreen(),
              ),
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
              GoRoute(
                path: 'article/:id',
                parentNavigatorKey:
                    _rootNavigatorKey, // Hide bottom nav for reading?
                builder: (context, state) {
                  final id = state.pathParameters['id']!;
                  return ArticleReaderScreen(itemId: id);
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
