import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_boilerplate/src/constants/fake_user_role.dart';
import 'package:flutter_riverpod_boilerplate/src/constants/user_roles.dart';
import 'package:flutter_riverpod_boilerplate/src/feature/authentication/auth_gate.dart';
import 'package:flutter_riverpod_boilerplate/src/feature/clientele/scheduling/presentation/bookings_screen.dart';
import 'package:flutter_riverpod_boilerplate/src/feature/clientele/scheduling/presentation/block_detail_screen.dart';
import 'package:flutter_riverpod_boilerplate/src/feature/clientele/scheduling/presentation/blocks_list_screen.dart';
import 'package:flutter_riverpod_boilerplate/src/routing/app_navigation_widget.dart';

import 'package:go_router/go_router.dart';

final _rootClienteleNavigatorKey = GlobalKey<NavigatorState>();
final _shellClienteleBookingsKey = GlobalKey<NavigatorState>(
  debugLabel: 'shellClienteleBookings',
);
final _shellClienteleMembershipKey = GlobalKey<NavigatorState>(
  debugLabel: 'shellClienteleMembership',
);
final _shellClienteleProfileKey = GlobalKey<NavigatorState>(
  debugLabel: 'shellClienteleProfile',
);

enum ClienteleRoute {
  signIn,
  clienteleBookings,
  tenantCalendar,
  clienteleMemberships,
  clienteleProfile,
  eventDetail,
}

final goRouterClienteleProvider = Provider((ref) {
  return GoRouter(
    initialLocation: '/clientele',
    navigatorKey: _rootClienteleNavigatorKey,
    debugLogDiagnostics: false,
    redirect: (context, state) {
      final path = state.uri.path;
      final userRole = FakeUserRole.tenant;
      if (path.startsWith('/profile') ||
          path.startsWith('/schedule') && userRole == UserRoles.clientele) {
        return '/clientele';
      }
      // check loggedIn state here then redirect to proper path
      return null;
    },
    routes: [
      GoRoute(
        path: '/signIn',
        name: ClienteleRoute.signIn.name,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: AuthGate()),
      ),
      StatefulShellRoute.indexedStack(
        pageBuilder: (context, state, navigationShell) => NoTransitionPage(
          child: AppNavigationWidget(navigationShell: navigationShell),
        ),
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellClienteleBookingsKey,
            routes: [
              GoRoute(
                path: '/clientele',
                name: ClienteleRoute.clienteleBookings.name,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: BookingsScreen()),
                routes: [
                  GoRoute(
                    path: '/bookings',
                    name: ClienteleRoute.tenantCalendar.name,
                    pageBuilder: (context, state) =>
                        const NoTransitionPage(child: BlocksList()),
                  ),
                  GoRoute(
                    path: '/event/detail',
                    name: ClienteleRoute.eventDetail.name,
                    pageBuilder: (context, state) =>
                        const NoTransitionPage(child: BlockDetail()),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellClienteleMembershipKey,
            routes: [
              GoRoute(
                path: '/clientele/memberships',
                name: ClienteleRoute.clienteleMemberships.name,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: Placeholder()),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellClienteleProfileKey,
            routes: [
              GoRoute(
                path: '/clientele/profile',
                name: ClienteleRoute.clienteleProfile.name,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: Placeholder()),
              ),
            ],
          ),
        ],
      ),
    ],
    errorPageBuilder: (context, state) => const NoTransitionPage(
      child: Scaffold(body: Center(child: Text('Page Not Found'))),
    ),
  );
});
