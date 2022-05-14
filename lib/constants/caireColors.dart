import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppColors with ChangeNotifier {
  Color? themeColor;

  Color splashColorOne = Color(0xffd29940);

  Color splashColorTwo = Color(0xff99551e);

  Color splashColorThree = Color(0xffdabe94);

  Color gridBoxColor = CaireColor.fromRGB(206,193,186);

  Color gridBoxColor2 = CaireColor.fromRGB(153,148,143);

  Color gridBoxColor3 = CaireColor.fromRGB(193,163,148);

  Color backGroundColor= Color(0xffF0F0FA);

  Color appTextColor = Color(0xff373733);

  Color appIconColor = Color(0xff373733);
  AppColors._() {
    themeColor = CaireColor.fromRGB(210, 153, 64);
  }

  static AppColors instance = AppColors._();

  static AppColors themeColors(BuildContext context) {
    return Provider.of<AppColors>(context);
  }
}

class CaireColor extends Color {
  CaireColor(int value) : super(value);

  static Color fromARGB(int a, int r, int g, int b) {
    return Color.fromARGB(a, r, g, b);
  }

  static Color fromRGB(int r, int g, int b) {
    return Color.fromARGB(255, r, g, b);
  }
}
