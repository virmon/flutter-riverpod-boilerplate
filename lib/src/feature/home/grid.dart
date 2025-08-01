import 'package:flutter/material.dart';
import 'package:flutter_riverpod_boilerplate/src/feature/examples/item_layout_grid.dart';
import 'package:flutter_riverpod_boilerplate/src/feature/examples/recent_activity_widget.dart';
import 'package:flutter_riverpod_boilerplate/src/feature/examples/schedule_list.dart';
import 'package:flutter_riverpod_boilerplate/src/feature/examples/stats_widget.dart';

const cellRed = Color(0xffc73232);
const cellMustard = Color(0xffd7aa22);
const cellGrey = Color(0xffcfd4e0);
const cellBlue = Color(0xff1553be);
const background = Color(0xff242830);

class GridWidget extends StatelessWidget {
  const GridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobileView = screenWidth < 600;

    List<Widget> items = [
      StatsWidget(),
      RecentActivityWidget(),
      ScheduleList(),
      ScheduleList(isUpcomingSchedule: true),
    ];

    if (isMobileView) {
      return Scaffold(
        body: SingleChildScrollView(child: Column(children: items)),
      );
    } else {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Dashboard',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            SizedBox(
              width: screenWidth * .8,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ItemLayoutGrid(
                  crossAxisCount: 2,
                  rowGap: 5,
                  columnGap: 5,
                  items: items,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
