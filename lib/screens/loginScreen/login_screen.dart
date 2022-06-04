import 'package:caireapp/constants/constants.dart';
import 'package:caireapp/screens/chat/chat_screen.dart';
import 'package:caireapp/screens/dashboardScreen/dashboardScreen.dart';
import 'package:caireapp/screens/forgotPassword/forgot_password_screen.dart';
import 'package:caireapp/screens/profile/profile_screen.dart';
import 'package:caireapp/screens/userBookingMain/booking_screen.dart';
import 'package:caireapp/util/appUtil.dart';
import 'package:caireapp/util/extensionForFontWeight.dart';
import 'package:caireapp/util/text.dart';
import 'package:caireapp/viewmodel/login_viewmodel/login_viewmodel.dart';
import 'package:caireapp/widgets/bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:universal_platform/universal_platform.dart';

import '../../constants/caireColors.dart';
import '../../device/device.dart';
import '../../widgets/caire_fields.dart';
import '../signUpScreen/signup_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';
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
           return ResponsiveWrapper.builder(
                Scaffold(
                   backgroundColor: AppColors.instance.beforeLoginScreensBackground,
                   body: Center(
                     child: SingleChildScrollView(
                       child: Container(
                         // width: UniversalPlatform.isWeb
                         //     ? MediaQuery.of(context).size.width / 2
                         //     : double.infinity,
                         margin:  EdgeInsetsDirectional.only(
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
                             // SizedBox(a
                             //   height: DynamicSize.height(0.01, context),
                             // ),
                             Text(
                               'Caire',
                               style: TextStyleUtil.textStyleBeforeLoginRaqiBook(
                                   context,
                                   fontSize: UniversalPlatform.isWeb ? Constants.webTitleFontSize : 24 ),
                               textAlign: TextAlign.center,
                             ),
                             UniversalPlatform.isWeb ? AppUtils.webTitleSpacing(context) : SizedBox(
                               height: DynamicSize.height(0.02, context),
                             ),
                             CarieTextFieldWithoutLabel(
                               focusedBorderColor: AppColors.instance.appTextColor,
                               enableBorderColor: AppColors.instance.appTextColor,
                               controller: emailController,
                               hintText: 'Username/Email',
                               hintStyle: TextStyleUtil.textStyleBeforeLoginRaqiBook(
                                 context,
                               ),
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
                             UniversalPlatform.isWeb ? AppUtils.webSpacingBetween(context) : SizedBox(
                               height: DynamicSize.height(0.024, context),
                             ),
                             CarieTextFieldWithoutLabel(
                               focusedBorderColor: AppColors.instance.appTextColor,
                               enableBorderColor: AppColors.instance.appTextColor,
                               obscureText: true,
                               controller: passwordController,
                               hintText: 'Password',
                               hintStyle: TextStyleUtil.textStyleBeforeLoginRaqiBook(
                                 context,
                               ),
                             ),
                             UniversalPlatform.isWeb ? AppUtils.webSpacingBetween(context) : SizedBox(
                               height: DynamicSize.height(0.024, context),
                             ),
                             Align(
                               alignment: Alignment.centerLeft,
                               child: InkWell(
                                 onTap: () {
                                   Navigator.push(
                                     context,
                                     MaterialPageRoute(
                                         builder: (context) => PasswordResetScreen()),
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
                             UniversalPlatform.isWeb ? AppUtils.webSpacingBetween(context) :   SizedBox(
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
                                     AppUtils.pushRoute(context: context, route: AppBottomBar(bottomBarPages: [  //    DashboardScreen(),
                                      DashboardScreen(),
                                       ChatScreen(),
                                       BookingMainScreen(),
                                       ProfileScreen(),]));
                                   }),
                             ),
                             UniversalPlatform.isWeb ? AppUtils.webSpacingBetween(context) :  SizedBox(
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
                                 //   MaterialPageRoute(
                                 //       builder: (context) => const ForgotUsernameScreen()),
                                 // );
                             //   },
                             //   child: Text(
                             //     'Forgot Username?',
                             //     style: TextStyleUtil.textStyleBeforeLoginRaqiBook(
                             //         context),
                             //     textAlign: TextAlign.center,
                             //   ),
                             // ),
                             UniversalPlatform.isWeb ? AppUtils.webTitleSpacing(context) : SizedBox(
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
                   ),),
                maxWidth:700,
                minWidth: 480,
                // defaultScale: true,
                breakpoints: [
                  ResponsiveBreakpoint.resize(480, name: MOBILE),
                  ResponsiveBreakpoint.autoScale(800, name: TABLET),
                  ResponsiveBreakpoint.resize(1000, name: DESKTOP),
                ],
                background: Container(color: Color(0xFFF5F5F5)));
            // initialRoute: "/",
          }),
    );
  }
}
