import 'package:caireapp/screens/dashboardScreen/dashboardScreen.dart';
import 'package:caireapp/util/text.dart';
import 'package:caireapp/viewmodel/login_viewmodel/login_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../constants/caireColors.dart';
import '../../device/device.dart';
import '../../widgets/caire_fields.dart';
import '../signUpScreen/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginViewModel loginViewModel = LoginViewModel();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ViewModelBuilder<LoginViewModel>.reactive(
          onModelReady: (model) {
            model.initialize(context);
          },
          viewModelBuilder: () => loginViewModel,
          builder: (contextBuilder, model, child) {
            return Scaffold(
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
                        style: TextStyleUtil.textStyleRaqiBook(context),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: DynamicSize.height(0.02, context),
                      ),
                      Text(
                          'Caire Inc. is the largest suburban Chicago, Caire service serving all suburbs, airports and downtown',
                          style: TextStyleUtil.textStyleRaqiBook(context),
                          textAlign: TextAlign.center),
                      SizedBox(
                        height: DynamicSize.height(0.02, context),
                      ),

                      CarieTextFieldWithoutLabel(
                        controller: emailController,
                        hintText: 'Username/Email',
                        hintStyle: TextStyleUtil.textStyleRaqiBook(context),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 20),
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
                        hintStyle:  TextStyleUtil.textStyleRaqiBook(context),
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
                            child:  Text(
                              'Login',
                              style: TextStyleUtil.textStyleRaqiBook(context),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()),
                              );
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
                          child:  Text(
                            'Register Now',
                            style: TextStyleUtil.textStyleRaqiBook(context),
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
                          style: TextStyleUtil.textStyleRaqiBook(context),
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
                          style: TextStyleUtil.textStyleRaqiBook(context),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: DynamicSize.height(0.05, context),
                      ),
                      Text(
                        'Copyright 2013 Caire App',
                        style: TextStyleUtil.textStyleRaqiBook(context),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
