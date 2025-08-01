import 'package:flutter/material.dart';
import 'package:flutter_riverpod_boilerplate/src/constants/app_colors.dart';

class ScheduleList extends StatelessWidget {
  const ScheduleList({super.key, this.isUpcomingSchedule = false});

  final double _minHeight = 360;

  final bool? isUpcomingSchedule;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobileView = MediaQuery.of(context).size.width < 600;

    final title = isUpcomingSchedule! ? 'Upcoming' : "Today's Schedule";
    final dateToday = 'Tuesday, 29 July';

    return Container(
      // margin: EdgeInsets.only(
      //   left: isMobileView ? 10 : 50,
      //   top: 10,
      //   right: isMobileView ? 10 : 50,
      //   bottom: 10,
      // ),
      margin: EdgeInsets.all(10.0),
      // width: screenWidth * 0.5,
      height: _minHeight,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightGrey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                right: 10.0,
                bottom: 20.0,
                left: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Visibility(
                    visible: !isUpcomingSchedule!,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.all(5.0),
                      child: Text(dateToday, style: TextStyle(fontSize: 12)),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: isUpcomingSchedule!,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.all(5.0),
                margin: const EdgeInsets.all(10.0),
                child: Text(dateToday, style: TextStyle(fontSize: 12)),
              ),
            ),
            ScheduleItem(
              color: ScheduleColor(
                AppColors.greenE4,
                AppColors.green63,
                AppColors.green92,
              ),
              data: Schedule('Detail', '8:00 AM - 9:00 PM', '8:00'),
            ),
            ScheduleItem(
              color: ScheduleColor(
                AppColors.violetF6,
                AppColors.violet99,
                AppColors.violetC2,
              ),
              data: Schedule('Detail', '11:00 AM - 12:00 PM', '11:00'),
            ),
            Visibility(
              visible: isUpcomingSchedule!,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.all(5.0),
                margin: const EdgeInsets.all(10.0),
                child: Text(dateToday, style: TextStyle(fontSize: 12)),
              ),
            ),
            ScheduleItem(
              color: ScheduleColor(
                AppColors.greenE4,
                AppColors.green63,
                AppColors.green92,
              ),
              data: Schedule('Detail', '8:00 AM - 9:00 PM', '8:00'),
            ),
            ScheduleItem(
              color: ScheduleColor(
                AppColors.violetF6,
                AppColors.violet99,
                AppColors.violetC2,
              ),
              data: Schedule('Detail', '11:00 AM - 12:00 PM', '11:00'),
            ),
            ScheduleItem(
              color: ScheduleColor(
                AppColors.greenE4,
                AppColors.green63,
                AppColors.green92,
              ),
              data: Schedule('Detail', '1:00 PM - 2:30 PM', '1:00'),
            ),
          ],
        ),
      ),
    );
  }
}

class ScheduleItem extends StatelessWidget {
  final ScheduleColor color;
  final Schedule data;

  const ScheduleItem({super.key, required this.color, required this.data});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final primaryColor = color.primaryColor;
    final secondaryColor = color.secondaryColor;
    final backgroundColor = color.backgroundColor;

    final label = data.label;
    final title = data.title;
    final subtitle = data.subtitle;

    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: SizedBox(
        width: screenWidth,
        height: 100,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topRight,
              width: 50.0,
              height: 50.0,
              child: Text(label, style: TextStyle(color: AppColors.lightGrey)),
            ),
            const VerticalDivider(
              width: 20,
              thickness: 1,
              endIndent: 0,
              color: AppColors.lightGrey,
            ),
            Flexible(
              child: Container(
                width: screenWidth * 0.7,
                height: 80.0,
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(5),
                  border: Border(
                    left: BorderSide(color: primaryColor, width: 5.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: secondaryColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Schedule {
  String title;
  String subtitle;
  String label;

  Schedule(this.title, this.subtitle, this.label);
}

class ScheduleColor {
  Color backgroundColor;
  Color primaryColor;
  Color secondaryColor;

  ScheduleColor(this.backgroundColor, this.primaryColor, this.secondaryColor);
}
