import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:oruphones/backend/authentication_methods.dart';
import 'package:oruphones/constants/app_colors.dart';
import 'package:oruphones/constants/app_images.dart';
import 'package:oruphones/widgets/appbutton_witharrow.dart';
import 'package:oruphones/authentication/verify_otp.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../homescreen/homescreen.dart';

class AccountNotFound extends StatefulWidget {
  const AccountNotFound({super.key});

  @override
  _AccountNotFoundState createState() => _AccountNotFoundState();
}

class _AccountNotFoundState extends State<AccountNotFound> {
  final TextEditingController _nameController = TextEditingController();
  AuthenticationMethods authenticationMethods = AuthenticationMethods();

  Future<Map<String, dynamic>?> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userDataString = prefs.getString("user_data");
    return userDataString != null ? jsonDecode(userDataString) : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BGColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25),
                // Close Button
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      // Handle close action
                    },
                  ),
                ),
                SizedBox(height: 20),

                // Logo
                Center(
                  child: Image.asset(
                    AppImages.logo,
                    height: 61,
                    width: 116,
                  ),
                ),
                SizedBox(height: 60),

                // Welcome Text
                Center(
                  child: Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: AppColors.loginScreenText,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                Center(
                  child: Text("Sign Up to continue",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400)),
                ),
                SizedBox(height: 100),

                // Phone Number Input
                Row(
                  children: [
                    Text(
                      "Please Tell Us Your Name",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400),
                    ),
                    Text("*", style: TextStyle(color: Colors.red),),
                  ],
                ),
                // SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        // padding: EdgeInsets.symmetric(horizontal: 12),
                        height: 54,
                        // width: 54,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          // borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              const SizedBox(width: 15),
                              Expanded(
                                child: TextField(
                                  keyboardType: TextInputType.text,
                                  controller: _nameController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Name",
                                    hintStyle: TextStyle(color: Color(0xffCCCCCC)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 100),
                // Terms and Conditions
                SizedBox(height: 10),
                // Next Button
                AppButtonWithArrow(
                    onPressed: () async {
                      // Load current user data (needed to extract the CSRF token)
                      Map<String, dynamic>? userData = await authenticationMethods.loadUserData();
                      print("User data before update: $userData");

                      // Extract CSRF token from the stored user data
                      String csrfToken = userData!['csrfToken'];

                      // Call updateUser and wait for it to complete
                      await authenticationMethods.updateUser("+91", _nameController.text, csrfToken);

                      // Refresh user data by calling checkLoginStatus so that local storage gets updated.
                      // (checkLoginStatus fetches the latest user info from the backend and calls saveUserData)
                      await authenticationMethods.checkLoginStatus(""); // Passing empty string since method reloads the cookie internally

                      // Now load the updated user data from SharedPreferences
                      Map<String, dynamic>? updatedUserData = await authenticationMethods.loadUserData();
                      print("Updated username: ${updatedUserData?['user']['userName']}");

                      // Navigate to the Homescreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HomeScreen()),
                      );
                    },
                    title: "Confirm Name"
                )
                ,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
