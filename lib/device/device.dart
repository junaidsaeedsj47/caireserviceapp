import 'package:flutter/material.dart';

class DynamicSize {
  static double height(double percentage, BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return height * percentage;
  }

  static double width(double percentage, BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return width * percentage;
  }
}