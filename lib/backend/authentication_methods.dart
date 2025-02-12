import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthenticationMethods {
  static final AuthenticationMethods _instance = AuthenticationMethods._internal();
  factory AuthenticationMethods() => _instance;
  AuthenticationMethods._internal();

  Future<void> saveCookie(String cookie) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("session_cookie", cookie);
  }

  Future<String?> loadCookie() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("session_cookie");
  }

  Future<void> saveUserData(Map<String, dynamic> userData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("user_data", jsonEncode(userData));
  }

  Future<Map<String, dynamic>?> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userDataString = prefs.getString("user_data");
    return userDataString != null ? jsonDecode(userDataString) : null;
  }

  Future<bool> sendOtp({required int countryCode, required int mobileNumber}) async {
    final String url = "http://40.90.224.241:5000/login/otpCreate";
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"countryCode": countryCode, "mobileNumber": mobileNumber}),
      );
      return response.statusCode == 200;
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }

  Future<bool> verifyOTP(String mobileNumber, String otp) async {
    final String apiUrl = "http://40.90.224.241:5000/login/otpValidate";
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "countryCode": 91,
          "mobileNumber": int.parse(mobileNumber),
          "otp": int.parse(otp),
        }),
      );
      if (response.statusCode == 200) {
        await fetchAndStoreCookie(response);
        return true;
      }
      return false;
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }

  Future<void> checkLoginStatus(String cookie) async {
    String? cookie = await loadCookie();
    final String apiUrl = "http://40.90.224.241:5000/isLoggedIn";
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json", "Cookie": cookie ?? ""},
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        print(responseData);
        if (responseData['isLoggedIn'] == true) {
          await saveUserData(responseData);
          print("User is logged in!");
        } else {
          print("User is not logged in.");
        }
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> updateUser(String countryCode, String userName, String csrfToken) async {
    final String apiUrl = "http://40.90.224.241:5000/update";
    // Load the session cookie from SharedPreferences
    String? sessionCookie = await loadCookie();

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          "X-Csrf-Token": csrfToken,
          "Content-Type": "application/json",
          "Cookie": sessionCookie ?? "",
        },
        body: jsonEncode({"countryCode": countryCode, "userName": userName}),
      );
      print(response.statusCode == 200
          ? "User updated successfully: ${response.body}"
          : "Failed to update user: ${response.statusCode}");
    } catch (e) {
      print("❌ Error: $e");
    }
  }


  Future<void> fetchAndStoreCookie(http.Response response) async {
    String? rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
      String sessionCookie = rawCookie.split(';')[0];
      await saveCookie(sessionCookie);
      print("Cookie saved: $sessionCookie");
    } else {
      print("No cookies found in the response.");
    }
  }
}
