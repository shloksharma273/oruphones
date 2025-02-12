import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_icons.dart';
import '../constants/app_images.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading:
      IconButton(onPressed: () {}, icon: Image.asset(AppIcons.hamburger)),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(AppImages.logo, height: 40, width: 61),
          SizedBox(
            width: 76,
          ),
          Text(
            "India",
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: 4,
          ),
          Image.asset(AppIcons.location)
        ],
      ),
      actions: [
        SizedBox(
          height: 33,
          width: 80,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  padding: EdgeInsets.zero,
                  backgroundColor: AppColors.homeScreenButtonColor,
                  elevation: 0),
              child: Text(
                "Login",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        )
      ],
    );
  }


  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
