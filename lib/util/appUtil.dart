import 'package:caireapp/constants/constants.dart';
import 'package:flutter/material.dart';

class AppUtils {
  AppUtils._();

  static void navigationRoute(
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
  static String getAppCurrency(){
    String currency="";
    if(Constants.appCurrency=="dollar"){
      currency= "\$";
    }
    return currency;
  }
}
