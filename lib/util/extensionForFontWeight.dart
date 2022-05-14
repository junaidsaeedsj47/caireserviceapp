import 'package:flutter/material.dart';

extension AppFontWeight on FontWeight {
  /// Light
  static FontWeight get light {
    return FontWeight.w300;
  }

  static FontWeight get regular {
    return FontWeight.w400;
  }

  static FontWeight get medium {
    return FontWeight.w500;
  }

  static FontWeight get semiBold {
    return FontWeight.w600;
  }

  static FontWeight get bold {
    return FontWeight.w700;
  }

  static get ultraBold {
    return FontWeight.w900;
  }
}