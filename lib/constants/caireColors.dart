import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppColors with ChangeNotifier {
  Color? themeColor;
  Color splashColorOne = CaireColor.fromRGB(210, 153, 64);

  Color splashColorTwo = CaireColor.fromRGB(153, 85, 30);

  Color splashColorThree = CaireColor.fromRGB(218,190,148);

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
