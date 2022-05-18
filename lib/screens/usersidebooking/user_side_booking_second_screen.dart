import 'package:caireapp/util/appUtil.dart';
import 'package:caireapp/viewmodel/usersidebooking/userside_booking_second_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:caireapp/constants/caireColors.dart';
import 'package:caireapp/model/service_data_model.dart';
import 'package:caireapp/util/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class UserSideBookingSecondScreen extends StatefulWidget {
  final ServiceModel? servicesData;

  UserSideBookingSecondScreen({Key? key, this.servicesData});

  @override
  _UserSideBookingSecondScreenState createState() =>
      _UserSideBookingSecondScreenState();
}

class _UserSideBookingSecondScreenState
    extends State<UserSideBookingSecondScreen> {
  @override
  Widget build(BuildContext context) {
    UserSideBookingSecondViewModel userSideBookingSecondViewModel =
        UserSideBookingSecondViewModel();
    return ViewModelBuilder<UserSideBookingSecondViewModel>.reactive(
        onModelReady: (model) {
          model.initialize(context);
        },
        viewModelBuilder: () => userSideBookingSecondViewModel,
        builder: (contextBuilder, model, child) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                iconTheme: IconThemeData(
                  color: AppColors
                      .instance.textWhiteColor, //change your color here
                ),
                centerTitle: true,
                title: Text(
                  "Book Service",
                  style: TextStyleUtil.textStyleRaqiBook(context,
                      fontSize: 24, color: AppColors.instance.textWhiteColor),
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  padding: AppUtils.unifiedPaddingOfScreen(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      // padding: EdgeInsetsDirectional.only(start: 10,top: 10,end: 10,bottom: 10),
                                      decoration: BoxDecoration(
                                        color: AppColors.instance.clear,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        border: Border.all(
                                            color:
                                                AppColors.instance.themeColor,
                                            width: 0.5),
                                      ),
                                      child: Center(
                                          child: Icon(
                                        Icons.check,
                                        color: AppColors.instance.themeColor,
                                      )),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Step 1",
                                      style: TextStyleUtil.textStyleRaqiBook(
                                          context,
                                          color:
                                              AppColors.instance.lightGreyText),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                dashedHorizontalLine(),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      // padding: EdgeInsetsDirectional.only(start: 10,top: 10,end: 10,bottom: 10),
                                      decoration: BoxDecoration(
                                        color: AppColors.instance.themeColor,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "02",
                                          style:
                                              TextStyleUtil.textStyleRaqiBook(
                                                  context,
                                                  fontSize: 14,
                                                  color:
                                                      AppColors.instance.white),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Step 2",
                                      style: TextStyleUtil.textStyleRaqiBook(
                                          context,
                                          color: AppColors.instance.black),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Confirm Price Details",
                        style: TextStyleUtil.textStyleRaqiBook(context,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      userBookingCardInformation(model),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          getPreviousButton(context, model),
                          SizedBox(width: 5,),
                          getNextButton(context, model),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: BottomNavigationBar(
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
                        Icons.notifications,
                        color: AppColors.instance.appIconColor,
                      ),
                      label: 'Notification',
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
                  currentIndex: model.selectedIndex,
                  selectedItemColor: AppColors.instance.appIconColor,
                  iconSize: 25,
                  onTap: model.onItemTapped,
                  elevation: 5),
            ),
          );
        });
  }

  Widget dashedHorizontalLine() {
    return Row(
      children: [
        for (int i = 0; i < 12; i++)
          Container(
            margin: EdgeInsetsDirectional.only(end: 6, bottom: 8),
            width: 5,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 0.5, color: AppColors.instance.lightGreyText)),
          ),
      ],
    );
  }

  Widget userBookingCardInformation(UserSideBookingSecondViewModel model) {
    return Container(
      padding: AppUtils.unifiedPaddingOfScreen(
          start: 20, end: 20, top: 20, bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.instance.backGroundColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          getLabelAndAmount(label: "Price", price: "\$50"),
          Divider(),
          getLabelAndAmount(label: "Sub Total", price: "120 * 2 = \$240"),
          Divider(),
          getLabelAndAmount(label: "Discount", price: "\$50"),
          Divider(),
          getLabelAndAmount(label: "Tax", price: "\$100"),
          Divider(),
          getTotalAmount(label: "Total Amount", price: "\$500"),
        ],
      ),
    );
  }

  Widget getLabelAndAmount(
      {String? label, String? price, double fontSize = 16}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label ?? "",
          style: TextStyleUtil.textStyleRaqiBook(context, fontSize: fontSize),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          price ?? "",
          style: TextStyleUtil.textStyleRaqiBook(context,
              color: AppColors.instance.lightGreyText, fontSize: fontSize),
        )
      ],
    );
  }

  Widget getTotalAmount({String? label, String? price, double}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label ?? "",
          style: TextStyleUtil.textStyleRaqiBook(
            context,
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          price ?? "",
          style: TextStyleUtil.textStyleRaqiBook(
            context,
            color: AppColors.instance.themeColor,
            fontSize: 20,
          ),
        )
      ],
    );
  }

  Widget getPreviousButton(
      BuildContext context, UserSideBookingSecondViewModel model) {
    return Expanded(
      child: CupertinoButton(
        color: AppColors.instance.white,
        onPressed: () {
          AppUtils.pop(context: context);
        },
        borderRadius: BorderRadius.circular(12),
        padding: EdgeInsetsDirectional.only(top: 10, bottom: 10),
        child: Text(
          "Previous",
          style: TextStyleUtil.textStyleRaqiBook(context, fontSize: 18),
        ),
      ),
    );
  }

  Widget getNextButton(
      BuildContext context, UserSideBookingSecondViewModel model) {
    return Expanded(
      child: CupertinoButton(
        color: AppColors.instance.themeColor,
        onPressed: () {
          AppUtils.navigationRoute(
              context: context, route: UserSideBookingSecondScreen());
        },
        borderRadius: BorderRadius.circular(12),
        padding: EdgeInsetsDirectional.only(top: 10, bottom: 10),
        child: Text(
          "Book",
          style: TextStyleUtil.textStyleRaqiBook(context,
              color: AppColors.instance.white, fontSize: 18),
        ),
      ),
    );
  }
}
