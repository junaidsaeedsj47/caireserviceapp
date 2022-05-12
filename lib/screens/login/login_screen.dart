import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/caireColors.dart';
import '../../device/device.dart';
import '../../widgets/caire_fields.dart';
import '../signup/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsetsDirectional.only(
                start: 20, end: 20, bottom: 10),
            child: Column(
              children: [
                SizedBox(
                  height: DynamicSize.height(0.1, context),
                ),
                // Image.asset(
                //   AmericanTaxiImageConstants.Common + 'logo.png',
                // ),
                // SizedBox(
                //   height: DynamicSize.height(0.01, context),
                // ),
                Text(
                  'Caire App',
                  style: TextStyle(
                      color: AppColors.instance.themeColor,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: DynamicSize.height(0.02, context),
                ),
                Text(
                    'Caire Inc. is the largest suburban Chicago, Caire service serving all suburbs, airports and downtown',
                    style: TextStyle(
                      // color: AppColors.getInstance().appGreyColor,
                      color: Colors.grey,
                      fontFamily: "Rubik",
                    ),
                    textAlign: TextAlign.center),
                SizedBox(
                  height: DynamicSize.height(0.02, context),
                ),

                CarieTextFieldWithoutLabel(
                  controller: emailController,
                  hintText: 'Username/Email',
                  hintStyle: const TextStyle(color: Color(0xffB4B4B4)),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                ),
//              TextFormField(
//                decoration: InputDecoration(
//                  hintText: 'Username/Email',
//                  hintStyle: const TextStyle(color: Color(0xffB4B4B4)),
//                  focusColor: Colors.transparent,
//                  contentPadding:
//                  const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
//                  border: OutlineInputBorder(
//                    borderRadius: BorderRadius.circular(12),
//                  ),
//                ),
//              ),
                SizedBox(
                  height: DynamicSize.height(0.024, context),
                ),
                CarieTextFieldWithoutLabel(
                  controller: passwordController,
                  hintText: 'Password',
                  hintStyle: const TextStyle(color: Color(0xffB4B4B4)),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                ),
//                TextFormField(
//                  obscureText: true,
//                  decoration: InputDecoration(
//                    focusColor: Colors.transparent,
//                    suffix: Image.asset(
//                      AmericanTaxiImageConstants.Common + 'eye.png',
//                    ),
//                    hintText: 'Password',
//                    hintStyle: const TextStyle(color: Color(0xffB4B4B4)),
//                    contentPadding: const EdgeInsets.symmetric(
//                        vertical: 18, horizontal: 20),
//                    border: OutlineInputBorder(
//                      borderRadius: BorderRadius.circular(12),
//                    ),
//                  ),
//                ),
                SizedBox(
                  height: DynamicSize.height(0.034, context),
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 35),
                  child: CupertinoButton(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.instance.themeColor,
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      onPressed: () {
//                        Navigator.push(
//                          context,
//                          MaterialPageRoute(builder: (context) => HomeScreen()),
//                        );
                      }),
                ),
                SizedBox(
                  height: DynamicSize.height(0.017, context),
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 35),
                  child: CupertinoButton(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.instance.themeColor,
                    child: const Text(
                      'Register Now',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: DynamicSize.height(0.018, context),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: DynamicSize.height(0.018, context),
                ),
                InkWell(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const ForgotUsernameScreen()),
                    // );
                  },
                  child: Text(
                    'Forgot Username?',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: DynamicSize.height(0.05, context),
                ),
                Text(
                  'Copyright 2013 Caire App',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
