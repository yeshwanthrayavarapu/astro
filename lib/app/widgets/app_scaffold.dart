import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Persistent scaffold with a Material 3 [NavigationBar] at the bottom.
///
/// Wraps the current route's content and keeps the navigation bar visible
/// across all 5 main tabs.
class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key, required this.child});

  final Widget child;

  static const List<_NavDestination> _destinations = [
    _NavDestination(
      icon: Icons.home_outlined,
      selectedIcon: Icons.home,
      label: 'Home',
      route: '/home',
    ),
    _NavDestination(
      icon: Icons.auto_awesome_outlined,
      selectedIcon: Icons.auto_awesome,
      label: 'Blueprint',
      route: '/blueprint',
    ),
    _NavDestination(
      icon: Icons.timeline_outlined,
      selectedIcon: Icons.timeline,
      label: 'Timing',
      route: '/timing',
    ),
    _NavDestination(
      icon: Icons.people_outline,
      selectedIcon: Icons.people,
      label: 'Bonds',
      route: '/bonds',
    ),
    _NavDestination(
      icon: Icons.library_books_outlined,
      selectedIcon: Icons.library_books,
      label: 'Library',
      route: '/library',
    ),
  ];

  int _selectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final idx = _destinations.indexWhere((d) => location.startsWith(d.route));
    return idx < 0 ? 0 : idx;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex(context),
        onDestinationSelected: (index) {
          context.go(_destinations[index].route);
        },
        destinations: _destinations
            .map(
              (d) => NavigationDestination(
                icon: Icon(d.icon),
                selectedIcon: Icon(d.selectedIcon),
                label: d.label,
              ),
            )
            .toList(),
      ),
    );
  }
}

class _NavDestination {
  const _NavDestination({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    required this.route,
  });

  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final String route;
}
