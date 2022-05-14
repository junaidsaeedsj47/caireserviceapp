import 'package:caireapp/constants/caireColors.dart';
import 'package:flutter/material.dart';

import 'extensionForFontWeight.dart';

class TextStyleUtil {

  static TextStyle textStyleRaqiBook(BuildContext context, {double fontSize = 16, Color? color}) {
    return _textStyle(
      context,
      fontSize: fontSize,
      color: color??AppColors.instance.appTextColor,
      fontWeight: AppFontWeight.regular,
    );
  }

  static TextStyle _textStyle(BuildContext context,
      {FontWeight? fontWeight,
      double fontSize = 12,
      Color? color,
      TextDecoration? decoration,
      FontStyle fontStyle = FontStyle.normal,
      double? letterSpacing}) {
    return TextStyle(
        color: color,
        fontSize: fontSize,
        letterSpacing: letterSpacing,
        fontFamily: appDefaultFont,
        height: 1.5,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        decoration: decoration);
  }

  static String get appDefaultFont {
    return "Raqi";
  }
}
