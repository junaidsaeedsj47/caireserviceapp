import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:caireapp/constants/caireColors.dart';
import 'package:caireapp/screens/loginScreen/login_screen.dart';
import 'package:caireapp/util/appUtil.dart';
import 'package:caireapp/util/text.dart';
import 'package:caireapp/viewmodel/splash_viewmodel/splash_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashScreenViewModel splashScreenViewModel = SplashScreenViewModel();

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
    return ViewModelBuilder<SplashScreenViewModel>.reactive(
        onModelReady: (model) {
          model.initialize(context);
        },
        viewModelBuilder: () => splashScreenViewModel,
        builder: (contextBuilder, model, child) {
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
                      AnimatedTextKit(
                        animatedTexts: [
                          WavyAnimatedText(
                            'Caire',
                            textStyle: TextStyleUtil.textStyleRaqiBook(context,fontSize: 24,),
                          ),
                        ],
                        isRepeatingAnimation: false,
                        onTap: () {
                          print("Tap Event");
                        },
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
        });
  }
}
