import 'package:flutter/material.dart';
import 'package:flutter_riverpod_boilerplate/src/constants/app_colors.dart';

class ReviewButtonWidget extends StatelessWidget {
  const ReviewButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey.shade300,
        foregroundColor: AppColors.violetC2,
        shadowColor: Colors.grey,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        minimumSize: Size(double.infinity, 50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(Icons.star_outline), Text('Review')],
      ),
    );
  }
}
