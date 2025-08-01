import 'package:flutter/material.dart';
import 'package:flutter_riverpod_boilerplate/src/constants/app_colors.dart';

class RecentActivityWidget extends StatelessWidget {
  const RecentActivityWidget({super.key});

  final double _minHeight = 360;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobileView = MediaQuery.of(context).size.width < 600;

    return Container(
      // margin: EdgeInsets.only(
      //   left: isMobileView ? 10 : 50,
      //   top: 20,
      //   right: isMobileView ? 10 : 50,
      //   bottom: 20,
      // ),
      margin: EdgeInsets.all(10.0),
      // width: screenWidth * 0.5,
      height: _minHeight,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightGrey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Recent Activities',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          RecentActivityItem(
            icon: Icon(Icons.calendar_today, color: AppColors.violet99),
            name: 'Vincent Wong',
            activity: 'Booked a class',
            timeLogged: '36 minutes ago',
          ),
          RecentActivityItem(
            icon: Icon(Icons.calendar_month_sharp, color: AppColors.violet99),
            name: 'Alice Wong',
            activity: 'Private class',
            timeLogged: '48 minutes ago',
          ),
          RecentActivityItem(
            icon: Icon(Icons.cancel, color: AppColors.violet99),
            name: 'Diane Lublin',
            activity: 'Cancelled class',
            timeLogged: '1 hour ago',
          ),
          RecentActivityItem(
            icon: Icon(Icons.calendar_today, color: AppColors.violet99),
            name: 'Candice Dee',
            activity: 'Booked a class',
            timeLogged: '1 hour ago',
          ),
        ],
      ),
    );
  }
}

class RecentActivityItem extends StatelessWidget {
  const RecentActivityItem({
    super.key,
    required this.icon,
    required this.name,
    required this.activity,
    required this.timeLogged,
  });

  final Icon icon;
  final String name;
  final String activity;
  final String timeLogged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.violetF6,
          borderRadius: BorderRadius.circular(5),
        ),
        child: icon,
      ),
      title: Text(
        name,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        activity,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w300,
          color: Colors.grey.shade600,
        ),
      ),
      trailing: Text(
        timeLogged,
        style: TextStyle(fontSize: 10, color: Colors.grey.shade500),
      ),
    );
  }
}
