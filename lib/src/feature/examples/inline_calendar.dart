import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod_boilerplate/src/common/booking_card_widget.dart';

class InlineCalendar extends StatefulWidget {
  const InlineCalendar({super.key});

  @override
  State<InlineCalendar> createState() => _InlineCalendarState();
}

class _InlineCalendarState extends State<InlineCalendar> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                  'https://picsum.photos/250?image=9',
                ),
                backgroundColor: Colors.transparent,
              ),
              title: Text('Business1'),
            ),
          ),
          EasyDateTimeLinePicker(
            firstDate: DateTime(2025, 1, 1),
            lastDate: DateTime(2030, 12, 31),
            focusedDate: _selectedDate,
            onDateChange: (date) {
              setState(() {
                _selectedDate = date;
              });
            },
          ),
          // BookingCardWidget(),
          // BookingCardWidget(),
          // BookingCardWidget(),
        ],
      ),
    );
  }
}
