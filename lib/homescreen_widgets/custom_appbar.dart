import 'package:flutter/material.dart';
import 'package:oruphones/authentication/login_screen.dart';
import 'package:oruphones/homescreen_widgets/oru_sidebar.dart';
import '../constants/app_colors.dart';
import '../constants/app_icons.dart';
import '../constants/app_images.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key, required this.openDrawer});

  final VoidCallback openDrawer;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      // leading: IconButton(
      //     onPressed: openDrawer, icon: Image.asset(AppIcons.hamburger)),
      leading: Builder(
        builder: (context) => IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: Image.asset(AppIcons.hamburger),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(AppImages.logo, height: 40, width: 61),
          const SizedBox(
            width: 76,
          ),
          const Text(
            "India",
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  padding: EdgeInsets.zero,
                  backgroundColor: AppColors.homeScreenButtonColor,
                  elevation: 0),
              child: const Text(
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
