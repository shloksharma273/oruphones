import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oruphones/authentication/login_screen.dart';
import 'package:oruphones/backend/authentication_methods.dart';
import 'package:oruphones/constants/app_images.dart';

class OruSidebar extends StatelessWidget {
  OruSidebar({Key? key}) : super(key: key);
  AuthenticationMethods authenticationMethods = AuthenticationMethods();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.lightBlueAccent),
            borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                  children: [
                    Image.asset(
                      AppImages.logo, // Replace with your logo asset path
                      height: 30,
                    ),

                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle Login/Signup
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3B3997),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: const Text(
                      'Login/SignUp',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle Sell Your Phone
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF2C94C),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      'Sell Your Phone',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async{
                      Map<String, dynamic>? userData = await authenticationMethods.loadUserData();
                      print("User data before update: $userData");

                      // Extract CSRF token from the stored user data
                      String csrfToken = userData!['csrfToken'];

                      bool isLoggedOut = await AuthenticationMethods().logout(csrfToken);
                      if (isLoggedOut) {
                        // Navigate to the login screen or update the UI accordingly.
                        print("User logged out successfully.");

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                        );
                      } else {
                        // Handle logout failure (e.g., show an error message).
                        print("Logout failed. Please try again.");
                      }

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF2C94C),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(), // Pushes the bottom buttons to the bottom
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildIconButtonWithLabel(
                        context, Icons.shopping_cart, 'How to Buy', () {}),
                    _buildIconButtonWithLabel(
                        context, Icons.attach_money, 'How to Sell', () {}),
                    _buildIconButtonWithLabel(
                        context, Icons.book, 'Oru Guide', () {}),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0, left: 8.0, right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildIconButtonWithLabel(
                        context, Icons.info, 'About Us', () {}),
                    _buildIconButtonWithLabel(
                        context, Icons.privacy_tip, 'Privacy Policy', () {}),
                    _buildIconButtonWithLabel(context, Icons.question_answer, 'FAQs', () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconButtonWithLabel(
      BuildContext context, IconData icon, String label, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 24),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
