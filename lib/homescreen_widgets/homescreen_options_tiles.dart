import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class HomeScreenOptionsTiles extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const HomeScreenOptionsTiles({
    required this.onPressed,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white, // Background color
        foregroundColor: Colors.black, // Text color
        elevation: 0, //Shadow
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        textStyle: const TextStyle(fontSize: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Rounded corners
          side: const BorderSide(color: AppColors.grey , width: 1.5),
        ),
      ),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w500
        ),
      ),
    );
  }
}
