import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.bottomCenter,
      child: FloatingActionButton.extended(
        onPressed: () {
        },
        label: Row(
          children: [
            const Text(
              'Sell',
              style: TextStyle(
                color: AppColors.homeScreenButtonColor, // Text color
                fontSize: 16, // Adjust the font size as needed
              ),
            ),
            const SizedBox(width: 4), // Spacing between text and icon
            Icon(
              Icons.add,
              color: AppColors.homeScreenButtonColor, // Icon color
            ),
          ],
        ),
        backgroundColor: Colors.grey[850], // Background color of the button
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0), // Rounded corners
          side: BorderSide(color: AppColors.homeScreenButtonColor, width: 4.0),
        ),
      ),
    );
  }
}
