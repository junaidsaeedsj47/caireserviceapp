import 'package:caireapp/screens/booking/booking_screen.dart';
import 'package:caireapp/screens/dashboardScreen/dashboardScreen.dart';
import 'package:caireapp/util/extensionForFontWeight.dart';
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
              backgroundColor: AppColors.instance.beforeLoginScreensBackground,
              body: Center(
                child: SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsetsDirectional.only(
                        start: 20, end: 20, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                          'Caire',
                          style: TextStyleUtil.textStyleBeforeLoginRaqiBook(
                              context,
                              fontSize: 24),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: DynamicSize.height(0.02, context),
                        ),
                        CarieTextFieldWithoutLabel(
                          focusedBorderColor: AppColors.instance.appTextColor,
                          enableBorderColor: AppColors.instance.appTextColor,
                          controller: emailController,
                          hintText: 'Username/Email',
                          hintStyle: TextStyleUtil.textStyleBeforeLoginRaqiBook(
                              context,),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 18, horizontal: 20),
                        ),
             // TextFormField(
             //   decoration: InputDecoration(
             //     hintText: 'Username/Email',
             //     hintStyle: const TextStyle(color: Color(0xffB4B4B4)),
             //     focusColor: Colors.transparent,
             //     contentPadding:
             //     const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
             //     border: OutlineInputBorder(
             //       borderRadius: BorderRadius.circular(12),
             //     ),
             //   ),
             // ),
                        SizedBox(
                          height: DynamicSize.height(0.024, context),
                        ),
                        CarieTextFieldWithoutLabel(
                          focusedBorderColor: AppColors.instance.appTextColor,
                          enableBorderColor: AppColors.instance.appTextColor,
                          obscureText: true,
                          controller: passwordController,
                          hintText: 'Password',
                          hintStyle: TextStyleUtil.textStyleBeforeLoginRaqiBook(
                              context,),
                        ),
                        SizedBox(
                          height: DynamicSize.height(0.024, context),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BookingScreen()),
                              );
                            },
                            child: Text(
                              'Forgot Password?',
                              style: TextStyleUtil.textStyleBeforeLoginRaqiBook(
                                  context),
                              textAlign: TextAlign.center,
                            ),
                          ),
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
                          height: DynamicSize.height(0.024, context),
                        ),
                        Container(
                          height: 50,
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 35),
                          child: CupertinoButton(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.instance.themeColor,
                              pressedOpacity: 0.8,
                              child: Text(
                                'Login',
                                style:
                                    TextStyleUtil.textStyleBeforeLoginRaqiBook(
                                        context,
                                        fontWeight: AppFontWeight.medium,
                                        color: AppColors.instance.white),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DashboardScreen()),
                                );
                              }),
                        ),
                        SizedBox(
                          height: DynamicSize.height(0.024, context),
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              child: Text(
                                'Register Now',
                                style:
                                    TextStyleUtil.textStyleBeforeLoginRaqiBook(
                                  context,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpScreen()),
                                );
                              },
                            )),
                        // SizedBox(
                        //   height: DynamicSize.height(0.024, context),
                        // ),

                        // SizedBox(
                        //   height: DynamicSize.height(0.018, context),
                        // ),
                        // InkWell(
                        //   onTap: () {
                        //     // Navigator.push(
                        //     //   context,
                        //     //   MaterialPageRoute(
                        //     //       builder: (context) => const ForgotUsernameScreen()),
                        //     // );
                        //   },
                        //   child: Text(
                        //     'Forgot Username?',
                        //     style: TextStyleUtil.textStyleBeforeLoginRaqiBook(
                        //         context),
                        //     textAlign: TextAlign.center,
                        //   ),
                        // ),
                        SizedBox(
                          height: DynamicSize.height(0.05, context),
                        ),
                        Text(
                          'Copyright 2022 Caire App',
                          style: TextStyleUtil.textStyleBeforeLoginRaqiBook(
                              context),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
