import 'package:flutter/material.dart';

/// Application theme configuration using Material 3.
///
/// Uses a deep indigo seed color to generate a harmonious ColorScheme
/// for both light and dark modes.
abstract final class AppTheme {
  // Deep indigo — calming, premium feel
  static const Color _seed = Color(0xFF6200EA); // Deep Purple

  /// Light theme
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: _seed,
          brightness: Brightness.light,
          surface: const Color(0xFFF9FAFB), // Very light grey surface
        ),
        textTheme: Typography.material2021().black.copyWith(
              displayLarge: const TextStyle(
                  fontFamily: 'Serif', fontWeight: FontWeight.bold),
              displayMedium: const TextStyle(
                  fontFamily: 'Serif', fontWeight: FontWeight.bold),
              displaySmall: const TextStyle(
                  fontFamily: 'Serif', fontWeight: FontWeight.bold),
              headlineLarge: const TextStyle(
                  fontFamily: 'Serif', fontWeight: FontWeight.bold),
              headlineMedium: const TextStyle(
                  fontFamily: 'Serif', fontWeight: FontWeight.bold),
              headlineSmall: const TextStyle(
                  fontFamily: 'Serif', fontWeight: FontWeight.bold),
              titleLarge: const TextStyle(
                  fontFamily: 'Serif', fontWeight: FontWeight.w600),
            ),
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          elevation: 0,
          scrolledUnderElevation: 1,
          backgroundColor: Colors.transparent,
        ),
        cardTheme: CardThemeData(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: Colors.white,
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: _seed,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          ),
        ),
        navigationBarTheme: NavigationBarThemeData(
          elevation: 0,
          backgroundColor: Colors.white,
          indicatorColor: _seed.withValues(alpha: 0.1),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          iconTheme: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return const IconThemeData(color: _seed);
            }
            return const IconThemeData(color: Colors.grey);
          }),
          labelTextStyle: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return const TextStyle(
                color: _seed,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              );
            }
            return const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            );
          }),
        ),
      );

  /// Dark theme
  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: _seed,
          brightness: Brightness.dark,
        ),
        textTheme: Typography.material2021().white.copyWith(
              displayLarge: const TextStyle(
                  fontFamily: 'Serif', fontWeight: FontWeight.bold),
              displayMedium: const TextStyle(
                  fontFamily: 'Serif', fontWeight: FontWeight.bold),
              displaySmall: const TextStyle(
                  fontFamily: 'Serif', fontWeight: FontWeight.bold),
              headlineLarge: const TextStyle(
                  fontFamily: 'Serif', fontWeight: FontWeight.bold),
              headlineMedium: const TextStyle(
                  fontFamily: 'Serif', fontWeight: FontWeight.bold),
              headlineSmall: const TextStyle(
                  fontFamily: 'Serif', fontWeight: FontWeight.bold),
              titleLarge: const TextStyle(
                  fontFamily: 'Serif', fontWeight: FontWeight.w600),
            ),
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          elevation: 0,
          scrolledUnderElevation: 1,
        ),
        cardTheme: CardThemeData(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          ),
        ),
        navigationBarTheme: NavigationBarThemeData(
          elevation: 3,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          indicatorColor: _seed.withValues(alpha: 0.2),
          iconTheme: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return IconThemeData(
                  color: _seed.withValues(alpha: 0.8)); // Lighter in dark mode?
            }
            return const IconThemeData(color: Colors.grey);
          }),
        ),
      );
}
