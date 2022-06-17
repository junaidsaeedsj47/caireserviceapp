import 'package:caireapp/constants/caireColors.dart';
import 'package:caireapp/screens/loginScreen/login_screen.dart';
import 'package:caireapp/util/appUtil.dart';
import 'package:caireapp/util/enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBottomBar extends StatefulWidget {
  final UserType userType;
  final List bottomBarPages;

  const AppBottomBar(
      {Key? key,
      required this.bottomBarPages,
      this.userType = UserType.LoggedIn})
      : super(key: key);

  @override
  _AppBottomBarState createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.bottomBarPages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.instance.backGroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              if (widget.userType == UserType.Guest) {
                AppUtils.pushRoute(context: context, route: LoginScreen());
              } else {
                setState(() {
                  pageIndex = 0;
                });
              }
            },
            icon: pageIndex == 0
                ? Icon(
                    Icons.home,
                    color: AppColors.instance.themeColor,
                    size: 25,
                  )
                : const Icon(
                    Icons.home,
                    color: Colors.black,
                    size: 25,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              if (widget.userType == UserType.Guest) {
                AppUtils.pushRoute(context: context, route: LoginScreen());
              } else {
                setState(() {
                  pageIndex = 1;
                });
              }
            },
            icon: pageIndex == 1
                ? Icon(
                    Icons.chat,
                    color: AppColors.instance.themeColor,
                    size: 25,
                  )
                : const Icon(
                    Icons.chat,
                    color: Colors.black,
                    size: 25,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              if (widget.userType == UserType.Guest) {
                AppUtils.pushRoute(context: context, route: LoginScreen());
              } else {
                setState(() {
                  pageIndex = 2;
                });
              }
            },
            icon: pageIndex == 2
                ? Icon(
                    Icons.event_note_sharp,
                    color: AppColors.instance.themeColor,
                    size: 25,
                  )
                : const Icon(
                    Icons.event_note_sharp,
                    color: Colors.black,
                    size: 25,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              if (widget.userType == UserType.Guest) {
                AppUtils.pushRoute(context: context, route: LoginScreen());
              } else {
                setState(() {
                  pageIndex = 3;
                });
              }
            },
            icon: pageIndex == 3
                ? Icon(
                    Icons.account_circle_outlined,
                    color: AppColors.instance.themeColor,
                    size: 25,
                  )
                : const Icon(
                    Icons.account_circle_outlined,
                    color: Colors.black,
                    size: 25,
                  ),
          ),
        ],
      ),
    );
  }
}
