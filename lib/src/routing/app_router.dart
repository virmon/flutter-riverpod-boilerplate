import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_boilerplate/src/feature/authentication/auth_gate.dart';
import 'package:flutter_riverpod_boilerplate/src/feature/examples/schedule_list.dart';
import 'package:flutter_riverpod_boilerplate/src/feature/home/data_table.dart';
import 'package:flutter_riverpod_boilerplate/src/feature/home/grid.dart';
import 'package:flutter_riverpod_boilerplate/src/routing/app_navigation_bar.dart';
import 'package:flutter_riverpod_boilerplate/src/feature/home/home.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHomeKey = GlobalKey<NavigatorState>(
  debugLabel: 'shellHome',
);
final _shellNavigatorProfileKey = GlobalKey<NavigatorState>(
  debugLabel: 'shellProfile',
);
final _shellNavigatorDataTableKey = GlobalKey<NavigatorState>(
  debugLabel: 'shellDataTable',
);

enum AppRoute { signIn, home, profile, dataTable }

final goRouterProvider = Provider((ref) {
  return GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: false,
    redirect: (context, state) {
      // final path = state.uri.path;
      // check loggedIn state here then redirect to proper path
      return null;
    },
    routes: [
      GoRoute(
        path: '/signIn',
        name: AppRoute.signIn.name,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: AuthGate()),
      ),
      StatefulShellRoute.indexedStack(
        pageBuilder: (context, state, navigationShell) => NoTransitionPage(
          child: AppNavigationBar(navigationShell: navigationShell),
        ),
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHomeKey,
            routes: [
              GoRoute(
                path: '/',
                name: AppRoute.home.name,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: Home()),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorProfileKey,
            routes: [
              GoRoute(
                path: '/profile',
                name: AppRoute.profile.name,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: GridWidget()),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorDataTableKey,
            routes: [
              GoRoute(
                path: '/dataTable',
                name: AppRoute.dataTable.name,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: MyDataTable()),
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
