import 'package:flutter/material.dart';
import 'package:flutter_riverpod_boilerplate/src/constants/app_colors.dart';
import 'package:flutter_riverpod_boilerplate/src/feature/examples/item_layout_grid.dart';

class StatsWidget extends StatelessWidget {
  const StatsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobileView = screenWidth < 600;
    final double minHeight = 360;

    return Container(
      // margin: EdgeInsets.only(
      //   left: isMobileView ? 10 : 50,
      //   top: 20,
      //   right: isMobileView ? 10 : 50,
      //   bottom: 20,
      // ),
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(20.0),
      // width: screenWidth * 0.5,
      height: minHeight,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightGrey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: ItemLayoutGrid(
        crossAxisCount: 2,
        items: [
          Container(
            width: screenWidth * .5,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: BoxBorder.all(color: AppColors.lightGrey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.people, size: 40),
                Text('Total Clients Today'),
                Text(
                  '19',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ],
            ),
          ),
          Container(
            width: screenWidth * .5,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: BoxBorder.all(color: AppColors.lightGrey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check, size: 40),
                Text('Total Class This Week'),
                Text(
                  '12 classes',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ],
            ),
          ),
          Container(
            width: screenWidth * .5,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: BoxBorder.all(color: AppColors.lightGrey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.star, size: 40),
                Text('Avg. Class Rating'),
                Text(
                  '4.8/5.0',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ],
            ),
          ),
          Container(
            width: screenWidth * .5,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: BoxBorder.all(color: AppColors.lightGrey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.description_outlined, size: 40),
                Text('Upcoming Bookings'),
                Text(
                  '4 scheduled',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
