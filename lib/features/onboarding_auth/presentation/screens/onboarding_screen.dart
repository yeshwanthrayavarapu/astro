import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  static const _pages = [
    _OnboardingPage(
      title: 'Understand Your Patterns',
      subtitle:
          'Discover the unique blueprint written in your birth data. Unlock who you truly are.',
      icon: Icons.self_improvement,
      gradientColors: [Color(0xFF5C35CC), Color(0xFF9B59B6)],
    ),
    _OnboardingPage(
      title: "Navigate Life's Timing",
      subtitle:
          'Know exactly when to act, rest, and grow. Align with your natural cycles.',
      icon: Icons.timeline,
      gradientColors: [Color(0xFF9B59B6), Color(0xFF1ABC9C)],
    ),
    _OnboardingPage(
      title: 'Decode Relationships',
      subtitle:
          'Understand your bonds at a deeper level. See compatibility and dynamics clearly.',
      icon: Icons.people,
      gradientColors: [Color(0xFF1ABC9C), Color(0xFF2980B9)],
    ),
    _OnboardingPage(
      title: 'Your Blueprint Awaits',
      subtitle:
          'Create your account to receive personalised insights tailored just for you.',
      icon: Icons.auto_awesome,
      gradientColors: [Color(0xFF2980B9), Color(0xFF5C35CC)],
    ),
  ];

  bool get _isLastPage => _currentPage == _pages.length - 1;

  Future<void> _markOnboardingSeen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_seen', true);
  }

  void _next() {
    if (_isLastPage) {
      _markOnboardingSeen();
      context.go('/auth/options');
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _skip() {
    _markOnboardingSeen();
    context.go('/auth/options');
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: cs.surface,
      body: SafeArea(
        child: Column(
          children: [
            // Skip button
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 8, right: 16),
                child: TextButton(
                  onPressed: _skip,
                  child: Text(
                    'Skip',
                    style: TextStyle(color: cs.onSurfaceVariant),
                  ),
                ),
              ),
            ),

            // Page view
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (i) => setState(() => _currentPage = i),
                itemBuilder: (context, index) =>
                    _OnboardingPageWidget(page: _pages[index]),
              ),
            ),

            // Dots indicator
            SmoothPageIndicator(
              controller: _pageController,
              count: _pages.length,
              effect: ExpandingDotsEffect(
                activeDotColor: cs.primary,
                dotColor: cs.outlineVariant,
                dotHeight: 8,
                dotWidth: 8,
                expansionFactor: 3,
              ),
            ),

            const SizedBox(height: 32),

            // Next / Get Started button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: FilledButton(
                onPressed: _next,
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(54),
                ),
                child: Text(
                  _isLastPage ? 'Get Started' : 'Next',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Data model for a single onboarding page
// ---------------------------------------------------------------------------

class _OnboardingPage {
  const _OnboardingPage({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.gradientColors,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final List<Color> gradientColors;
}

// ---------------------------------------------------------------------------
// Widget for a single onboarding page
// ---------------------------------------------------------------------------

class _OnboardingPageWidget extends StatelessWidget {
  const _OnboardingPageWidget({required this.page});

  final _OnboardingPage page;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Illustration card with gradient
          Container(
            width: double.infinity,
            height: 280,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: page.gradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: page.gradientColors.first.withAlpha(60),
                  blurRadius: 32,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: Icon(
              page.icon,
              size: 100,
              color: Colors.white.withAlpha(230),
            ),
          ),
          const SizedBox(height: 40),

          // Title
          Text(
            page.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: cs.onSurface,
                  height: 1.2,
                ),
          ),
          const SizedBox(height: 16),

          // Subtitle
          Text(
            page.subtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: cs.onSurfaceVariant,
                  height: 1.5,
                ),
          ),
        ],
      ),
    );
  }
}
