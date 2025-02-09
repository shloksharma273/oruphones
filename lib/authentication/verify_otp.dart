import 'dart:async';
import 'package:oruphones/authentication/account_not_found.dart';
import 'package:oruphones/authentication/login_screen.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter/material.dart';
import 'package:oruphones/constants/app_colors.dart';
import 'package:oruphones/constants/app_images.dart';
import 'package:oruphones/widgets/appbutton_witharrow.dart';

class VerifyOtp extends StatefulWidget {
  final String mobileNumber;
  const VerifyOtp({Key? key, required this.mobileNumber}) : super(key: key);

  @override
  _VerifyOtpState createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  bool _termsAccepted = false;

  List<String> otp = ['', '', '', ''];
  int timerSeconds = 23;
  bool resendEnabled = false;
  Timer? _timer;
  List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timerSeconds > 0) {
        setState(() {
          timerSeconds--;
        });
      } else {
        setState(() {
          resendEnabled = true;
        });
        timer.cancel();
      }
    });
  }

  void handleInputChange(int index, String value) {
    if (value.isNotEmpty) {
      setState(() {
        otp[index] = value;
      });
      if (index < otp.length - 1) {
        FocusScope.of(context).requestFocus(focusNodes[index + 1]);
      } else {
        //OPTIONAL: Implement what happens when all fields are filled
        FocusScope.of(context).unfocus();
      }
    } else {
      setState(() {
        otp[index] = value;
      });
      if (index > 0) {
        FocusScope.of(context).requestFocus(focusNodes[index - 1]);
      }
    }
  }

  void handleResendClick() {
    if (resendEnabled) {
      // Implement your resend OTP logic here
      print('Resending OTP...');
      setState(() {
        timerSeconds = 23;
        resendEnabled = false;
        otp = ['', '', '', '']; // Clear the OTP input
      });
      startTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.BGColor,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LoginScreen()),
              );
            },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.close, color: Colors.black))
        ],
      ),
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
                    "Verify Mobile No.",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: AppColors.loginScreenText,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Center(
                  child: RichText(
                    // Use RichText
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        // Default style for the whole text
                        fontSize: 13,
                        color: Colors.grey,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(
                            text:
                                "Please enter the 4 digital verification code sent to your mobile "),
                        TextSpan(
                          text: "${widget.mobileNumber}",
                          style: TextStyle(
                              fontWeight:
                                  FontWeight.bold), // Bold style for number
                        ),
                        TextSpan(text: " number via "),
                        TextSpan(
                          text: "SMS",
                          style: TextStyle(
                              fontWeight:
                                  FontWeight.bold), // Bold style for SMS
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 80),
                Center(
                  child: Pinput(
                    length: 4,
                    onChanged: (value) {
                      setState(() {});
                    },
                    defaultPinTheme: PinTheme(
                      width: 50,
                      height: 50,
                      textStyle: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),

                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Didn't receive OTP?",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff757474),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      TextButton(
                        onPressed: resendEnabled ? handleResendClick : null,
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all(EdgeInsets.zero),
                        ),
                        child: Text(
                          resendEnabled
                              ? "Resend OTP"
                              : "Resend OTP in 0:${timerSeconds < 10 ? '0' : ''}$timerSeconds Sec",
                          style: TextStyle(
                            decoration: resendEnabled
                                ? TextDecoration.underline
                                : TextDecoration.none,
                            fontSize: 12,
                            color: Color(0xff191919),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Terms and Conditions
                SizedBox(height: 80),
                // Next Button
                AppButtonWithArrow(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AccountNotFound()),
                      );
                    },
                    title: "Verify OTP")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
