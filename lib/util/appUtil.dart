import 'package:caireapp/constants/caireColors.dart';
import 'package:caireapp/constants/constants.dart';
import 'package:caireapp/device/device.dart';
import 'package:caireapp/screens/chat/chat_screen.dart';
import 'package:caireapp/screens/dashboardScreen/dashboardScreen.dart';
import 'package:caireapp/screens/profile/profile_screen.dart';
import 'package:caireapp/screens/service/service_screen.dart';
import 'package:caireapp/screens/userBookingMain/booking_screen.dart';
import 'package:caireapp/util/text.dart';
import 'package:caireapp/widgets/bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:universal_platform/universal_platform.dart';

class AppUtils {
  AppUtils._();

  static int selectedIndex = 0;

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

  static showFormattedDate(DateTime date) {
    if (date != null) {
      return DateFormat('dd-MM-yyyy').format(date);
    }
  }

  static showFormattedDateWithMonthName(date) {
    if (date != null) {
      return DateFormat('dd MMMM, yyyy').format(date);
    }
  }

  static showFormattedTime(DateTime time) {
    if (time != null) {
      return DateFormat('kk:mm a').format(time);
    }
  }

  static bool isTabletDevice(BuildContext context) {
    return MediaQuery.of(context).size.width < 1100 &&
        MediaQuery.of(context).size.width >= 650;
  }

  static bool isMobileDevice(BuildContext context) {
    return MediaQuery.of(context).size.width < 650;
  }
  static bool checkMobileDeviceForPopup(BuildContext context) {
    return  MediaQuery.of(context).size.width < 850;
  }

  static bool isDesktopDevice(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1100;
  }

  static AppBar showAppBar({
    BuildContext? context,
    String? title,
    bool showBack = true,
    bool centerTitle = true,
  }) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: showBack ? true : false,
      iconTheme: IconThemeData(
        color: AppColors.instance.textWhiteColor, //change your color here
      ),
      centerTitle: centerTitle,
      // backgroundColor: AppColors.instance.themeColor,
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

  static AppBar showAppBarWithAction(
      {required BuildContext context,
      String? title,
      bool showBack = true,
      bool centerTitle = true,
      Widget? actionWidget,
      bool transparentAppBar=false,
      double? titleFontSize = 24}) {
    return AppBar(
      actions: actionWidget != null ? [actionWidget!] : [],
      automaticallyImplyLeading: showBack ? true : false,
      iconTheme: IconThemeData(
        color: AppColors.instance.textWhiteColor, //change your color here
      ),
      centerTitle: centerTitle,
      elevation: 0,
      backgroundColor: transparentAppBar ?  AppColors.instance.clear : AppColors.instance.themeColor,
      title: Text(
        title ?? "",
        style: TextStyleUtil.textStyleRaqiBook(context,
            fontSize: titleFontSize!, color: AppColors.instance.textWhiteColor),
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.instance.themeColor, // Status bar
      ),
    );
  }

  static Widget appBottomBar(BuildContext context) {
    return BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home,
              color: AppColors.instance.themeColor,
            ),
            icon: Icon(
              Icons.home,
              color: AppColors.instance.appIconColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.chat,
                color: AppColors.instance.themeColor,
              ),
              icon: Icon(
                Icons.chat,
                color: AppColors.instance.appIconColor,
              ),
              label: 'Chat',
              backgroundColor: Colors.yellow),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.notifications,
              color: AppColors.instance.themeColor,
            ),
            icon: Icon(
              Icons.event_note_rounded,
              color: AppColors.instance.appIconColor,
            ),
            label: 'Orders',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.person,
              color: AppColors.instance.themeColor,
            ),
            icon: Icon(
              Icons.person,
              color: AppColors.instance.appIconColor,
            ),
            label: 'Profile',
            backgroundColor: Colors.blue,
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedItemColor: AppColors.instance.appIconColor,
        iconSize: 25,
        onTap: (index) {
          // changeSelectedScreen(index);
        },
        elevation: 5);
  }

  static void pushAndRemove(BuildContext context,Widget screenName) {
    Route route = MaterialPageRoute(
        settings: RouteSettings(name: Constants.providerServicesRouteName),
        builder: (context) => screenName);
    Navigator.pushAndRemoveUntil(
      context,
      route,
      (Route<dynamic> route) => false,
    );
  }

  static void moveToDashboard(BuildContext context,List bottomBar) {
    Route route = MaterialPageRoute(
        settings: RouteSettings(name: Constants.dashboardRouteName),
        builder: (context) => AppBottomBar(
          bottomBarPages: bottomBar,
              // bottomBarPages: [
              //   DashboardScreen(),
              //   ChatScreen(),
              //   BookingMainScreen(),
              //   ProfileScreen(),
              // ],
            ));
    Navigator.pushAndRemoveUntil(
      context,
      route,
      (Route<dynamic> route) => false,
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

  static EdgeInsets dialogPadding(BuildContext context) {
    return EdgeInsets.all(20);
  }
}
