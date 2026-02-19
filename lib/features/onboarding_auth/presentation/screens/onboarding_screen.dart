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
      title: 'Understand your\npatterns',
      subtitle:
          'Navigate your life with cosmic clarity.\nDiscover the rhythm of your personal universe.',
      planetColors: [
        Color(0xFF8E99F3),
        Color(0xFF1C2541)
      ], // Light blue-purple to dark
    ),
    _OnboardingPage(
      title: 'Align with\nthe cosmos',
      subtitle:
          'Know exactly when to act, rest, and grow.\nYour timing is written in the stars.',
      planetColors: [
        Color(0xFFC393D9),
        Color(0xFF4A148C)
      ], // Orchid to deep purple
    ),
    _OnboardingPage(
      title: 'Deepen your\nconnections',
      subtitle:
          'Understand your bonds at a deeper level.\nSee compatibility and dynamics clearly.',
      planetColors: [Color(0xFF80CBC4), Color(0xFF004D40)], // Teal to dark teal
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
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeOutCubic,
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
    // Light lavender/pink background gradient
    const backgroundGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFFFDFBFD), // Almost white
        Color(0xFFF3E5F5), // Very light purple
        Color(0xFFE1BEE7), // Light purple
      ],
      stops: [0.0, 0.5, 1.0],
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

          // Content
          SafeArea(
            child: Column(
              children: [
                // Top bar: Icon and Skip
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // App Icon (small)
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFF7E57C2).withValues(alpha: 0.2),
                        ),
                        child: const Icon(
                          Icons.auto_awesome,
                          color: Color(0xFF673AB7),
                          size: 20,
                        ),
                      ),
                      // Skip button
                      TextButton(
                        onPressed: _skip,
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                            color: Color(0xFF7E909A),
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                // Page View
                SizedBox(
                  height: 560, // Increased height to prevent overflow (was 500)
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _pages.length,
                    onPageChanged: (i) => setState(() => _currentPage = i),
                    itemBuilder: (context, index) =>
                        _OnboardingPageWidget(page: _pages[index]),
                  ),
                ),

                const Spacer(),

                // Bottom Action Area
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                  child: Column(
                    children: [
                      // Button
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: FilledButton(
                          onPressed: _next,
                          style: FilledButton.styleFrom(
                            backgroundColor:
                                const Color(0xFF6200EA), // Deep purple
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 8,
                            shadowColor:
                                const Color(0xFF6200EA).withValues(alpha: 0.4),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _isLastPage ? 'Get Started' : 'Continue',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              if (!_isLastPage) ...[
                                const SizedBox(width: 8),
                                const Icon(Icons.arrow_forward_rounded,
                                    size: 20),
                              ],
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Indicators
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: _pages.length,
                        effect: const ScrollingDotsEffect(
                          activeDotColor: Color(0xFF6200EA),
                          dotColor: Color(0xFFD1C4E9),
                          dotHeight: 8,
                          dotWidth: 8,
                          activeDotScale: 1.2,
                          spacing: 12,
                        ),
                      ),
                    ],
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

// ---------------------------------------------------------------------------
// Data & Widgets
// ---------------------------------------------------------------------------

class _OnboardingPage {
  const _OnboardingPage({
    required this.title,
    required this.subtitle,
    required this.planetColors,
  });

  final String title;
  final String subtitle;
  final List<Color> planetColors;
}

class _OnboardingPageWidget extends StatelessWidget {
  const _OnboardingPageWidget({required this.page});

  final _OnboardingPage page;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Planet Visual
        _PlanetVisual(colors: page.planetColors),

        const SizedBox(height: 32), // Reduced spacing (was 48)

        // Title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            page.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Serif', // Fallback to system serif
              fontSize: 32,
              height: 1.1,
              fontWeight: FontWeight.w400,
              color: Color(0xFF1A1A1A), // Almost black
              letterSpacing: -0.5,
            ),
          ),
        ),

        const SizedBox(height: 16),

        // Subtitle
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            page.subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              height: 1.5,
              color: Color(0xFF7E909A), // Muted blue-grey
            ),
          ),
        ),
      ],
    );
  }
}

class _PlanetVisual extends StatefulWidget {
  const _PlanetVisual({required this.colors});

  final List<Color> colors;

  @override
  State<_PlanetVisual> createState() => _PlanetVisualState();
}

class _PlanetVisualState extends State<_PlanetVisual>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: const Size(280, 280), // Reduced from 320 to help with overflow
          painter: _ComplexPlanetPainter(
            colors: widget.colors,
            rotation: _controller.value * 2 * 3.14159,
          ),
        );
      },
    );
  }
}

class _ComplexPlanetPainter extends CustomPainter {
  final List<Color> colors;
  final double rotation;

  _ComplexPlanetPainter({
    required this.colors,
    required this.rotation,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final sphereRadius = size.width * 0.35; // 35% of container width

    _drawGlow(canvas, center, sphereRadius);
    _drawBackRings(canvas, center, sphereRadius);
    _drawSphere(canvas, center, sphereRadius);
    _drawFrontRings(canvas, center, sphereRadius);
  }

  void _drawGlow(Canvas canvas, Offset center, double radius) {
    final paint = Paint()
      ..color = colors.last.withValues(alpha: 0.5) // Reduced intensity
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 50);

    canvas.drawCircle(center, radius, paint);
  }

  void _drawSphere(Canvas canvas, Offset center, double radius) {
    final spherePath = Path()
      ..addOval(Rect.fromCircle(center: center, radius: radius));

    canvas.save();
    canvas.clipPath(spherePath);

    // 1. Base Gradient (Spherical look)
    final gradient = RadialGradient(
      center: const Alignment(-0.4, -0.4), // More dramatic lighting
      radius: 1.3,
      colors: [
        colors.first,
        colors.last, // Dark
        Colors.black, // Shadow
      ],
      stops: const [0.1, 0.6, 1.0],
    );

    final rect = Rect.fromCircle(center: center, radius: radius);
    final paint = Paint()..shader = gradient.createShader(rect);
    canvas.drawRect(rect, paint);

    // 2. Texture Bands (Swirls)
    _drawTextureBands(canvas, center, radius);

    // 3. Inner Shadow/Atmosphere overlay
    final shadowPaint = Paint()
      ..shader = RadialGradient(
        center: const Alignment(0.4, 0.4), // Bottom-right shadow
        radius: 1.0,
        colors: [
          Colors.transparent,
          Colors.black.withValues(alpha: 0.3),
          Colors.black.withValues(alpha: 0.7),
        ],
        stops: const [0.4, 0.8, 1.0],
      ).createShader(rect);
    canvas.drawRect(rect, shadowPaint);

    canvas.restore();
  }

  void _drawTextureBands(Canvas canvas, Offset center, double radius) {
    final paint = Paint()..style = PaintingStyle.fill;

    // More bands, smoother look
    for (int i = 0; i < 7; i++) {
      final path = Path();
      // Normalize i to -1..1 range
      final t = (i / 6.0) * 2.0 - 1.0;

      final yBase = t * radius * 0.8; // Spread fewer towards poles
      final waveHeight = 10.0 + (i % 3) * 5.0; // Variant wave heights

      // Soft white for light bands, dark for others
      final isLight = i % 2 == 0;
      paint.color = (isLight ? Colors.white : Colors.black)
          .withValues(alpha: 0.03 + (i * 0.01)); // Very subtle

      // Start point (left side)
      path.moveTo(center.dx - radius, center.dy + yBase);

      // Curve across
      path.cubicTo(
          center.dx - radius * 0.3,
          center.dy + yBase + waveHeight,
          center.dx + radius * 0.3,
          center.dy + yBase - waveHeight,
          center.dx + radius,
          center.dy + yBase);

      // Thick line back
      path.lineTo(center.dx + radius, center.dy + yBase + 25);
      path.cubicTo(
          center.dx + radius * 0.3,
          center.dy + yBase + 25 - waveHeight,
          center.dx - radius * 0.3,
          center.dy + yBase + 25 + waveHeight,
          center.dx - radius,
          center.dy + yBase + 25);
      path.close();

      canvas.save();
      // Rotate the whole band system to look tilted
      canvas.translate(center.dx, center.dy);
      canvas.rotate(0.3); // Static tilt
      canvas.translate(-center.dx, -center.dy);
      canvas.drawPath(path, paint);
      canvas.restore();
    }
  }

  // Ring Logic
  void _drawBackRings(Canvas canvas, Offset center, double radius) {
    _drawRingPart(canvas, center, radius, isBack: true);
  }

  void _drawFrontRings(Canvas canvas, Offset center, double radius) {
    _drawRingPart(canvas, center, radius, isBack: false);
  }

  void _drawRingPart(Canvas canvas, Offset center, double radius,
      {required bool isBack}) {
    final ringPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0 // Thinner rings
      ..strokeCap = StrokeCap.round;

    final ringRadiusX = radius * 1.8;
    final ringRadiusY = radius * 0.5;

    // More rings, finer detail
    for (int i = 0; i < 12; i++) {
      final offset = i * 2.5;
      final rx = ringRadiusX + offset;
      final ry = ringRadiusY + (offset * 0.3);

      ringPaint.color = i % 2 == 0
          ? colors.first.withValues(alpha: 0.3 - (i * 0.02))
          : colors.last.withValues(alpha: 0.2 - (i * 0.015));

      canvas.save();
      canvas.translate(center.dx, center.dy);
      canvas.rotate(-0.35); // Slightly more tilt

      final rect =
          Rect.fromCenter(center: Offset.zero, width: rx * 2, height: ry * 2);

      final startAngle = isBack ? 3.14159 - 0.2 : -0.2; // Slight overlap fix?
      final sweepAngle = 3.14159 + 0.4;

      canvas.drawArc(rect, startAngle, sweepAngle, false, ringPaint);

      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant _ComplexPlanetPainter oldDelegate) {
    return oldDelegate.rotation != rotation || oldDelegate.colors != colors;
  }
}
