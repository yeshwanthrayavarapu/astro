import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_pattern/app/router.dart';
import 'package:life_pattern/app/theme.dart';

/// Root application widget.
///
/// Reads the [routerProvider] from Riverpod so the router can watch
/// auth state and redirect accordingly.
class LifePatternApp extends ConsumerWidget {
  const LifePatternApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'LifePattern',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}
