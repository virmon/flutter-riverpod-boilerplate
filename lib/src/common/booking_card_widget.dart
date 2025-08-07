import 'package:flutter/material.dart';
import 'package:flutter_riverpod_boilerplate/src/common/cancel_button_widget.dart';
import 'package:flutter_riverpod_boilerplate/src/common/review_button_widget.dart';
import 'package:flutter_riverpod_boilerplate/src/constants/app_colors.dart';

class BookingCardWidget extends StatelessWidget {
  final String buttonText;

  const BookingCardWidget({super.key, this.buttonText = 'Book'});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobileView = screenWidth < 600;

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
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/avatar_placeholder.jpg'),
                  backgroundColor: Colors.transparent,
                ),
                title: const Text('Business1 - Description'),
                subtitle: const Text('Location'),
              ),
              ListTile(
                title: Text(
                  'Jul 26, 2025 3:00 PM * 55 mins',
                  style: TextStyle(color: AppColors.grey),
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Builder(
                  builder: (context) {
                    switch (buttonText) {
                      case 'Cancel':
                        return CancelButtonWidget();
                      case 'Review':
                        return ReviewButtonWidget();
                      default:
                        return ElevatedButton(
                          onPressed: () => {},
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
                          child: Text(buttonText),
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
