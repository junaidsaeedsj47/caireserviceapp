import 'package:caireapp/constants/caireColors.dart';
import 'package:caireapp/constants/constants.dart';
import 'package:caireapp/device/device.dart';
import 'package:caireapp/util/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:universal_platform/universal_platform.dart';

class AppUtils {
  AppUtils._();

  static bool isIOS() {
    return UniversalPlatform.isIOS;
  }

  static bool isAndroid() {
    return UniversalPlatform.isAndroid;
  }

  static bool isWeb() {
//    return Platform.isIOS;
    return UniversalPlatform.isWeb;
  }
  static showFormattedDate(DateTime date){
    return DateFormat('dd-MM-yyyy').format(date);
  }

  static showFormattedTime(DateTime time){
    return DateFormat('kk:mm a').format(time);
  }
  static bool isTabletDevice(BuildContext context) {
    return MediaQuery.of(context).size.width < 1100 &&
        MediaQuery.of(context).size.width >= 650;
  }

  static bool isMobileDevice(BuildContext context) {
    return MediaQuery.of(context).size.width < 650;
  }

  static bool isDesktopDevice(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1100;
  }

  static AppBar showAppBar(
      {BuildContext? context, String? title, bool showBack = true}) {
    return AppBar(
      automaticallyImplyLeading: showBack ? true : false,
      iconTheme: IconThemeData(
        color: AppColors.instance.textWhiteColor, //change your color here
      ),
      centerTitle: true,
      title: Text(
        title ?? "",
        style: TextStyleUtil.textStyleRaqiBook(context!,
            fontSize: 24, color: AppColors.instance.textWhiteColor),
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.instance.themeColor, // Status bar
      ),
    );
  }

  static void pushRoute(
      {@required BuildContext? context,
      bool fromRoot = false,
      required Widget route,
      Function? valueCallBack,
      bool pushReplacement = false,
      RouteSettings? setting}) {
    _pushScreen(
        context: context!,
        route: _getRouteScreen(setting, route),
        valueCallBack: valueCallBack,
        fromRoot: fromRoot,
        pushReplacement: pushReplacement);
  }

  static MaterialPageRoute _getRouteScreen(
      RouteSettings? setting, Widget route) {
    return MaterialPageRoute(
        settings: setting ?? RouteSettings(name: route.toString()),
        builder: (context) {
          return route;
        });
  }

  static void _pushScreen(
      {@required BuildContext? context,
      bool fromRoot = false,
      var route,
      Function? valueCallBack,
      bool pushReplacement = false}) {
    {
      if (pushReplacement) {
        Navigator.of(context!, rootNavigator: fromRoot)
            .pushReplacement(route)
            .then((value) {
          if (valueCallBack != null) {
            valueCallBack(value);
          }
        });
      } else {
        Navigator.of(context!, rootNavigator: fromRoot)
            .push(route)
            .then((dynamic value) {
          if (valueCallBack != null) {
            valueCallBack(value);
          }
        });
      }
    }
  }

  static void pop(
      {@required BuildContext? context,
      bool fromRoot = false,
      var valueToReturn}) {
    if (Navigator.of(context!, rootNavigator: fromRoot).canPop()) {
      Navigator.of(context, rootNavigator: fromRoot).pop(valueToReturn);
    }
  }

  static bool canPop({@required BuildContext? context, bool fromRoot = false}) {
    if (context != null) {
      return Navigator.of(context, rootNavigator: fromRoot).canPop();
    }
    return false;
  }

  static String getAppCurrency() {
    String currency = "";
    if (Constants.appCurrency == "dollar") {
      currency = "\$";
    }
    return currency;
  }

  static EdgeInsetsGeometry unifiedPaddingOfScreen({
    double? start,
    double? bottom,
    double? end,
    double? top,
  }) {
    return EdgeInsetsDirectional.only(
        start: start ?? 10,
        end: end ?? 10,
        top: top ?? 20,
        bottom: bottom ?? 20);
  }

  static SizedBox webTitleSpacing(BuildContext context) {
    return SizedBox(
      height: DynamicSize.height(0.04, context),
    );
  }

  static SizedBox webSubTitleSpacing(BuildContext context) {
    return SizedBox(
      height: DynamicSize.height(0.04, context),
    );
  }

  static SizedBox webSpacingBetween(BuildContext context) {
    return SizedBox(
      height: DynamicSize.height(0.04, context),
    );
  }
}
