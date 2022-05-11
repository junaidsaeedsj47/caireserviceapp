import 'package:caireapp/constants/caireColors.dart';
import 'package:caireapp/screens/dashboardScreen/homeScreen.dart';
import 'package:caireapp/screens/login/login_screen.dart';
import 'package:caireapp/util/appUtil.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      AppUtils.navigationRoute(context: context, route: const LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              AppColors.instance.splashColorThree,
              AppColors.instance.splashColorOne,
              AppColors.instance.splashColorTwo,
            ],
          )),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Caire',
                  style: TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                CircularProgressIndicator(
                    color: CaireColor.fromRGB(237, 234, 231)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
