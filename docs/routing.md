# App Routing

## How to create navigation routes?
1. Create a unique navigation key for your new route in `app_router.dart`

    ```dart
    final _shellNavigatorProfileKey = GlobalKey<NavigatorState>();
    ```

2. In the same file, add a `StatefulShellBranch` and place it in `branches` of `StatefulShellRoute.indexedStack`

    ```dart
    StatefulShellRoute.indexedStack(
        ...
        branches:[
            ...
            StatefulShellBranch(
                navigatorKey: <UNIQUE_NAVIGATION_KEY>,
                routes: [
                  GoRoute(
                    path: <STRING_PATH>,
                    name: <STRING_NAME>,
                    pageBuilder: (context, state) => const NoTransitionPage(child: <SCAFFOLD_WIDGET>),
                  ),
                ],
              ),
        ]
      )
    ```

3. Add a `NavigationDestination` in `scaffold_with_navigation_bar.dart`

    ```dart
    NavigationDestination(
      label: 'Profile', 
      icon: Icon(Icons.person, color: Colors.white70),
    ),
    ```

3. Add a `NavigationDestination` in `scaffold_with_navigation_rail.dart`

    ```dart
    NavigationRailDestination(
      label: Text('Profile'),
      icon: Icon(Icons.home, color: Colors.white70),
    ),
    ```