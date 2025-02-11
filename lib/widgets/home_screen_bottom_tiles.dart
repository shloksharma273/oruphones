import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_images.dart';

class HomeScreenBottomTiles extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback onPressed;
  const HomeScreenBottomTiles({
    required this.image,
    required this.onPressed,
    required this.text,
    super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 80,
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              fit: BoxFit.fitHeight,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500, fontSize: 13),
            )
          ],
        ),
      ),
    );
  }
}
