import 'package:caireapp/device/device.dart';
import 'package:caireapp/screens/loginScreen/login_screen.dart';
import 'package:caireapp/util/appUtil.dart';
import 'package:caireapp/util/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:universal_platform/universal_platform.dart';

import '../../constants/caireColors.dart';
import '../../widgets/caire_fields.dart';

class PasswordResetScreen extends StatefulWidget {
  const PasswordResetScreen({Key? key}) : super(key: key);

  @override
  _PasswordResetScreenState createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  TextEditingController controller = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              margin:
               EdgeInsetsDirectional.only(start: 20, end: 20, bottom: 10,top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [


                  Text(
                    'Caire',
                    style: TextStyleUtil.textStyleBeforeLoginRaqiBook(context,
                        fontSize: 24),
                  ),
                  UniversalPlatform.isWeb ? AppUtils.webTitleSpacing(context) : SizedBox(
                    height: DynamicSize.height(0.02, context),
                  ),
                  Text(
                    'Enter the 8 unique characters',
                    style: TextStyleUtil.textStyleRaqiBook(context,fontSize: 20,),
                    textAlign: TextAlign.center,
                  ),
                  UniversalPlatform.isWeb ? AppUtils.webTitleSpacing(context) : SizedBox(
                    height: DynamicSize.height(0.02, context),
                  ),
                  CarieTextFieldWithoutLabel(
                    suffix: Icon(Icons.remove_red_eye),
                    obscureText: true,
                    focusedBorderColor: AppColors.instance.appTextColor,
                    enableBorderColor: AppColors.instance.appTextColor,
                    controller: controller,
                    hintText: 'New Password',
                    hintStyle: TextStyleUtil.textStyleBeforeLoginRaqiBook(
                      context,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 20),
                  ),
                  UniversalPlatform.isWeb ? AppUtils.webSpacingBetween(context) : SizedBox(
                    height: DynamicSize.height(0.024, context),
                  ),
                  CarieTextFieldWithoutLabel(
                    suffix: Icon(Icons.remove_red_eye),
                    obscureText: true,
                    focusedBorderColor: AppColors.instance.appTextColor,
                    enableBorderColor: AppColors.instance.appTextColor,
                    controller: confirmController,
                    hintText: 'Confirm Password',
                    hintStyle: TextStyleUtil.textStyleBeforeLoginRaqiBook(
                      context,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 20),
                  ),
                  UniversalPlatform.isWeb ? AppUtils.webTitleSpacing(context) : SizedBox(
                    height: DynamicSize.height(0.03, context),
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.instance.themeColor,
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                            color: AppColors.instance.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
