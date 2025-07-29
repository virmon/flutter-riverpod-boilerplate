import 'package:flutter/material.dart';
import 'package:flutter_riverpod_boilerplate/src/routing/scaffold_with_navigation_bar.dart';
import 'package:flutter_riverpod_boilerplate/src/routing/scaffold_with_navigation_rail.dart';
import 'package:go_router/go_router.dart';

class NavigationLabel {
  static const home = 'Home';
  static const profile = 'Profile';
}

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({Key? key, required this.navigationShell})
    : super(key: key ?? const ValueKey('AppNavigationBar'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 450) {
          return ScaffoldWithNavigationBar(
            body: navigationShell,
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: _goBranch,
          );
        } else {
          return ScaffoldWithNavigationRail(
            body: navigationShell,
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: _goBranch,
          );
        }
      },
    );
  }
}
