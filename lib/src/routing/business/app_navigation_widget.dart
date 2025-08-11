import 'package:flutter/material.dart';
import 'package:flutter_riverpod_boilerplate/src/constants/fake_user_role.dart';
import 'package:flutter_riverpod_boilerplate/src/constants/user_roles.dart';
import 'package:flutter_riverpod_boilerplate/src/routing/clientele/clientele_navigation_bar.dart';
import 'package:flutter_riverpod_boilerplate/src/routing/clientele/clientele_navigation_rail.dart';
import 'package:flutter_riverpod_boilerplate/src/routing/scaffold_with_navigation_bar.dart';
import 'package:flutter_riverpod_boilerplate/src/routing/scaffold_with_navigation_rail.dart';
import 'package:go_router/go_router.dart';

class NavigationLabel {
  static const home = 'Home';
  static const profile = 'Profile';
  static const dataTable = 'Data Table';
  static const calendar = 'Calendar';
}

class ClienteleNavigationLabel {
  static const bookings = 'Bookings';
  static const memberships = 'Memberships';
  static const profile = 'Profile';
}

class AppNavigationWidget extends StatelessWidget {
  const AppNavigationWidget({Key? key, required this.navigationShell})
    : super(key: key ?? const ValueKey('AppNavigationBar'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  Widget _clienteleNavigationWidget(
    BuildContext context,
    BoxConstraints constraints,
  ) {
    if (constraints.maxWidth < 450) {
      return ClienteleNavigationBar(
        body: navigationShell,
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: _goBranch,
      );
    } else {
      return ClienteleNavigationRail(
        body: navigationShell,
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: _goBranch,
      );
    }
  }

  Widget _tenantNavigationWidget(
    BuildContext context,
    BoxConstraints constraints,
  ) {
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
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final userRole = FakeUserRole.tenant;

        switch (userRole) {
          case UserRoles.clientele:
            return _clienteleNavigationWidget(context, constraints);
          default:
            return _tenantNavigationWidget(context, constraints);
        }
      },
    );
  }
}
