import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod_boilerplate/src/common/booking_card_widget.dart';
import 'package:flutter_riverpod_boilerplate/src/feature/clientele/helper.dart';
import 'package:flutter_riverpod_boilerplate/src/routing/clientele/clientele_router.dart';
import 'package:go_router/go_router.dart';

class BlocksList extends StatefulWidget {
  const BlocksList({super.key});

  @override
  State<BlocksList> createState() => _BlocksListState();
}

class _BlocksListState extends State<BlocksList> {
  DateTime _selectedDate = DateTime.now();
  DateTime _currentWeekTimeline = getMondayOfCurrentWeek();

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
                backgroundImage: AssetImage('assets/avatar_placeholder2.jpg'),
                backgroundColor: Colors.transparent,
              ),
              title: Text('Business1'),
            ),
          ),
          Column(
            children: [
              EasyDateTimeLinePicker(
                firstDate: _currentWeekTimeline,
                lastDate: _currentWeekTimeline.add(Duration(days: 6)),
                headerOptions: HeaderOptions(headerType: HeaderType.viewOnly),
                focusedDate: _selectedDate,
                timelineOptions: TimelineOptions(padding: EdgeInsets.all(10)),
                selectionMode: SelectionMode.autoCenter(),
                itemExtent: 50,
                onDateChange: (date) {
                  setState(() {
                    _selectedDate = date;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _currentWeekTimeline = _currentWeekTimeline.subtract(
                          Duration(days: 7),
                        );
                      });
                    },
                    icon: Icon(Icons.arrow_circle_left_rounded),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _currentWeekTimeline = _currentWeekTimeline.add(
                          Duration(days: 7),
                        );
                      });
                    },
                    icon: Icon(Icons.arrow_circle_right_rounded),
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            child: BookingCardWidget(),
            onTap: () => context.goNamed(ClienteleRoute.eventDetail.name),
          ),
          BookingCardWidget(),
          BookingCardWidget(),
        ],
      ),
    );
  }
}
