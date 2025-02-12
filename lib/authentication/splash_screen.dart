import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:oruphones/backend/authentication_methods.dart';
import 'package:oruphones/homescreen/homescreen.dart';
import 'package:oruphones/authentication/account_not_found.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthenticationMethods _authMethods = AuthenticationMethods();

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  /// Performs asynchronous tasks required at app startup.
  Future<void> _initializeApp() async {
    // 1. Display the splash animation for 2 seconds.
    await Future.delayed(const Duration(seconds: 2));

    // 2. (Optional) Refresh the authentication state.
    // Here, we call checkLoginStatus to update local storage (SharedPreferences)
    // with the latest authentication state.
    await _authMethods.checkLoginStatus("");

    // 3. Load the user data from local storage.
    Map<String, dynamic>? userData = await _authMethods.loadUserData();

    // 4. Decide which screen to navigate to.
    //    - If userData is not null and indicates the user is logged in,
    //      check if the 'userName' is empty. If so, navigate to the Confirm Name screen.
    //    - Otherwise, navigate to the Home Screen.
    Widget targetScreen = const HomeScreen();

    if (userData != null && userData['isLoggedIn'] == true) {
      final user = userData['user'];
      // Check if the user is new (i.e. userName is empty or null)
      if (user == null ||
          user['userName'] == null ||
          user['userName'].toString().trim().isEmpty) {
        targetScreen = const AccountNotFound();
      } else {
        targetScreen = const HomeScreen();
      }
    } else {
      // Not authenticated – in this example we still navigate to HomeScreen.
      targetScreen = const HomeScreen();
    }

    // 5. Navigate to the chosen screen.
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => targetScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set your desired background color.
      body: Center(
        // Lottie animation loaded from a JSON file stored in your assets.
        child: Lottie.asset(
          'assets/json/Splash.json', // Make sure this file is in your assets and declared in pubspec.yaml.
          width: 400,
          height: 400,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
