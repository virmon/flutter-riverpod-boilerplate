import 'package:flutter/material.dart';
import 'package:flutter_riverpod_boilerplate/src/routing/app_navigation_bar.dart';

class ScaffoldWithNavigationRail extends StatelessWidget {
  const ScaffoldWithNavigationRail({
    super.key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
            labelType: NavigationRailLabelType.all,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                label: Text(NavigationLabel.home),
                icon: Icon(Icons.home, color: Colors.white70),
              ),
              NavigationRailDestination(
                label: Text(NavigationLabel.profile),
                icon: Icon(Icons.person, color: Colors.white70),
              ),
              NavigationRailDestination(
                label: Text(NavigationLabel.calendar),
                icon: Icon(Icons.calendar_month, color: Colors.white70),
              ),
              NavigationRailDestination(
                label: Text(NavigationLabel.dataTable),
                icon: Icon(Icons.storage, color: Colors.white70),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: body),
        ],
      ),
    );
  }
}
