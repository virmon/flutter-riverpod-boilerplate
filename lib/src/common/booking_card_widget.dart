import 'package:flutter/material.dart';
import 'package:flutter_riverpod_boilerplate/src/common/cancel_button_widget.dart';
import 'package:flutter_riverpod_boilerplate/src/common/review_button_widget.dart';
import 'package:flutter_riverpod_boilerplate/src/constants/app_colors.dart';
import 'package:flutter_riverpod_boilerplate/src/constants/mock_data.dart';

class ButtonLabel {
  static const book = 'Book';
  static const cancel = 'Cancel';
  static const review = 'Review';
}

class BookingCardWidget extends StatelessWidget {
  final String title;
  final String startTime;
  final String location;
  final String status;

  const BookingCardWidget({
    super.key,
    required this.title,
    required this.startTime,
    required this.location,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobileView = screenWidth < 600;

    final isAvatarVisible = status != BookingStatus.attended.name;

    String buttonLabel = ButtonLabel.book;
    if (status == BookingStatus.cancelled.name) {
      buttonLabel = ButtonLabel.cancel;
    } else if (status == BookingStatus.attended.name) {
      buttonLabel = ButtonLabel.review;
    } else {
      buttonLabel = ButtonLabel.book;
    }

    return Center(
      child: Card(
        margin: const EdgeInsets.fromLTRB(5, 10, 5, 10),
        // margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Padding(
          // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          padding: const EdgeInsets.fromLTRB(0, 10, 5, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                leading: Visibility(
                  visible: isAvatarVisible,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                      'assets/avatar_placeholder.jpg',
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                title: Text(title),
                subtitle: Text(location),
              ),
              ListTile(
                title: Text(startTime, style: TextStyle(color: AppColors.grey)),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Builder(
                  builder: (context) {
                    switch (buttonLabel) {
                      case ButtonLabel.cancel:
                        return CancelButtonWidget();
                      case ButtonLabel.review:
                        return ReviewButtonWidget();
                      default:
                        return ElevatedButton(
                          onPressed: () {
                            // todo: implement book functionality
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.violetC2,
                            foregroundColor: Colors.white,
                            shadowColor: Colors.grey,
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            minimumSize: Size(double.infinity, 50),
                          ),
                          child: Text(buttonLabel),
                        );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
