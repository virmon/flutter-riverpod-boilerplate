import 'package:flutter/material.dart';
import 'package:flutter_riverpod_boilerplate/src/constants/app_colors.dart';
import 'package:flutter_riverpod_boilerplate/src/feature/scheduling/domain/schedule.dart';

class ScheduleList extends StatelessWidget {
  const ScheduleList({
    super.key,
    this.isUpcomingSchedule = false,
    required this.schedules,
  });

  final bool? isUpcomingSchedule;
  final List<ScheduleModel> schedules;

  final double _minHeight = 360;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobileView = screenWidth < 600;

    final title = isUpcomingSchedule! ? 'Upcoming' : "Today's Schedule";
    final dateToday = _formatDate(DateTime.now());

    return Container(
      margin: const EdgeInsets.all(10.0),
      height: _minHeight,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightGrey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  if (!isUpcomingSchedule!)
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        dateToday,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                ],
              ),
            ),

            // Schedule items
            if (schedules.isEmpty)
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text('No schedules found.'),
              )
            else
              ...schedules.map((schedule) {
                return ScheduleItem(
                  color: ScheduleColor(
                    AppColors.greenE4,
                    AppColors.green63,
                    AppColors.green92,
                  ),
                  data: schedule,
                );
              }).toList(),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final weekdays = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    final months = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    final weekday = weekdays[date.weekday - 1];
    final day = date.day;
    final month = months[date.month];
    return '$weekday, $day $month';
  }
}

class ScheduleItem extends StatelessWidget {
  final ScheduleColor color;
  final ScheduleModel data;

  const ScheduleItem({super.key, required this.color, required this.data});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final primaryColor = color.primaryColor;
    final secondaryColor = color.secondaryColor;
    final backgroundColor = color.backgroundColor;

    final title = data.title;
    final subtitle =
        "${_formatTime(data.time)} • ${data.duration} • ${data.location}";
    final label = _formatTime(data.time);

    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: SizedBox(
        width: screenWidth,
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topRight,
              width: 50.0,
              height: 50.0,
              child: Text(
                label,
                style: const TextStyle(color: AppColors.lightGrey),
              ),
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

  String _formatTime(DateTime time) {
    final localTime = TimeOfDay.fromDateTime(time);
    final hour = localTime.hourOfPeriod == 0 ? 12 : localTime.hourOfPeriod;
    final minute = localTime.minute.toString().padLeft(2, '0');
    final period = localTime.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }
}

class ScheduleColor {
  Color backgroundColor;
  Color primaryColor;
  Color secondaryColor;

  ScheduleColor(this.backgroundColor, this.primaryColor, this.secondaryColor);
}
