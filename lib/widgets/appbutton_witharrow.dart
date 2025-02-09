import 'package:flutter/material.dart';
import 'package:oruphones/constants/app_colors.dart';

class AppButtonWithArrow extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const AppButtonWithArrow({
    required this.onPressed,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          backgroundColor: AppColors.loginScreenText, // Assuming a dark purple color
          padding: EdgeInsets.symmetric(vertical: 15),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(width: 5),
            Icon(Icons.arrow_forward, color: Colors.white, size: 20,)
            
          ],
        ),
      ),
    );
  }
}
