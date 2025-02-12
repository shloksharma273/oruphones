import 'package:flutter/material.dart';
import 'package:oruphones/backend/authentication_methods.dart';
import 'package:oruphones/constants/app_colors.dart';
import 'package:oruphones/constants/app_images.dart';
import 'package:oruphones/widgets/appbutton_witharrow.dart';
import 'package:oruphones/authentication/verify_otp.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _termsAccepted = false;
  final TextEditingController _mobileNumberController = TextEditingController();
  AuthenticationMethods authenticationMethods = AuthenticationMethods();

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
                  child: Text("Sign in to continue",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400)),
                ),
                SizedBox(height: 100),

                // Phone Number Input
                Text(
                  "Enter Your Phone Number",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400),
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
                              Text(
                                "+91",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TextField(
                                  keyboardType: TextInputType.phone,
                                  controller: _mobileNumberController,
                                  maxLength: 10,
                                  decoration: InputDecoration(
                                    counterText: '',
                                    border: InputBorder.none,
                                    hintText: "Mobile Number",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: _termsAccepted,
                      onChanged: (bool? value) {
                        setState(() {
                          _termsAccepted = value!;
                        });
                      },
                    ),
                    Text(
                      "Accept ",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Handle terms and conditions link
                      },
                      child: Text(
                        "Terms and condition",
                        style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                // Next Button
                AppButtonWithArrow(
                  onPressed: () async {
                    String mobileNumber = _mobileNumberController.text;
                    if (mobileNumber.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Mobile Number can't be empty"),));
                      return;
                    }
                    else if (mobileNumber.length < 10){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter the Complete Mobile Number"),));
                      return;
                    }
                    print("Mobile Number: $mobileNumber");
                    if(await authenticationMethods.sendOtp(countryCode: 91, mobileNumber: int.parse(mobileNumber)) && _termsAccepted) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VerifyOtp(mobileNumber: mobileNumber),
                        ),
                      );
                    } else if (!_termsAccepted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please Accept Terms & Conditions")),
                      );
                    }
                  },
                  title: "Next",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
