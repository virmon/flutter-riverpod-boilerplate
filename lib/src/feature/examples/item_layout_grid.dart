import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_riverpod_boilerplate/src/feature/examples/schedule_list.dart';

class ItemLayoutGrid extends StatelessWidget {
  final int crossAxisCount;
  final List<Widget> items;

  final double? rowGap;

  final double? columnGap;

  const ItemLayoutGrid({
    super.key,
    required this.crossAxisCount,
    required this.items,
    this.rowGap = 20,
    this.columnGap = 20,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutGrid(
      columnSizes: crossAxisCount == 2 ? [1.fr, 1.fr] : [1.fr],
      rowSizes: crossAxisCount == 2
          ? const [auto, auto]
          : const [auto, auto, auto, auto],
      rowGap: rowGap,
      columnGap: columnGap,
      children: [for (var i = 0; i < items.length; i++) items[i]],
    );
  }
}
