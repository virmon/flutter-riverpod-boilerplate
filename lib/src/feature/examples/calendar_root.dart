import 'package:flutter/material.dart';
import 'package:flutter_riverpod_boilerplate/src/common/booking_card_widget.dart';
import 'package:flutter_riverpod_boilerplate/src/routing/app_router.dart';
import 'package:go_router/go_router.dart';

class CalendarRoot extends StatefulWidget {
  const CalendarRoot({super.key});

  @override
  State<CalendarRoot> createState() => _CalendarRootState();
}

class _CalendarRootState extends State<CalendarRoot> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20.0,
            ),
            child: Text(
              'Book Now',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                spacing: 25.0,
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () =>
                          context.goNamed(AppRoute.calendarDetail.name),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                              'https://picsum.photos/250?image=9',
                            ),
                          ),
                          Text('Business1'),
                        ],
                      ),
                    ),
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () =>
                          context.goNamed(AppRoute.calendarDetail.name),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                              'https://picsum.photos/250?image=237',
                            ),
                          ),
                          Text('Business2'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20.0,
            ),
            child: Text(
              'Upcoming',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          BookingCardWidget(buttonText: 'Cancel'),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20.0,
            ),
            child: Text(
              'Past Bookings',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          BookingCardWidget(buttonText: 'Review'),
          BookingCardWidget(buttonText: 'Review'),
        ],
      ),
    );
  }
}
