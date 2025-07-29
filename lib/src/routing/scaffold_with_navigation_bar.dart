import 'package:flutter/material.dart';
import 'package:flutter_riverpod_boilerplate/src/routing/app_navigation_bar.dart';

class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar({
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
      body: body,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: const [
          NavigationDestination(
            label: NavigationLabel.home,
            icon: Icon(Icons.home, color: Colors.white70),
          ),
          NavigationDestination(
            label: NavigationLabel.profile,
            icon: Icon(Icons.person, color: Colors.white70),
          ),
          NavigationDestination(
            label: NavigationLabel.dataTable,
            icon: Icon(Icons.storage, color: Colors.white70),
          ),
        ],
        onDestinationSelected: onDestinationSelected,
      ),
    );
  }
}
