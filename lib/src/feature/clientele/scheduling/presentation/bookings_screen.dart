import 'package:flutter/material.dart';
import 'package:flutter_riverpod_boilerplate/src/common/booking_card_widget.dart';
import 'package:flutter_riverpod_boilerplate/src/common/carousel_widget.dart';
import 'package:flutter_riverpod_boilerplate/src/routing/clientele/clientele_router.dart';
import 'package:go_router/go_router.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 10,
                ),
                child: Row(
                  spacing: 25.0,
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () =>
                            context.goNamed(ClienteleRoute.tenantCalendar.name),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(
                                'assets/avatar_placeholder2.jpg',
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
                            context.goNamed(ClienteleRoute.tenantCalendar.name),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(
                                'assets/avatar_placeholder2.jpg',
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
            // _buildCarousel(context),
            Carousel(
              children: [
                BookingCardWidget(buttonText: 'Cancel'),
                BookingCardWidget(buttonText: 'Cancel'),
              ],
            ),
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
      ],
    );
  }
}
