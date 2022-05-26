import 'package:caireapp/screens/usersidebooking/user_side_booking_second_screen.dart';
import 'package:caireapp/util/appUtil.dart';
import 'package:caireapp/viewmodel/usersidebooking/user_side_booking_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:caireapp/constants/caireColors.dart';
import 'package:caireapp/model/service_data_model.dart';
import 'package:caireapp/util/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:stacked/stacked.dart';

class UserSideBookingScreen extends StatefulWidget {
  final ServiceModel? servicesData;

  UserSideBookingScreen({Key? key, this.servicesData});

  @override
  _UserSideBookingScreenState createState() => _UserSideBookingScreenState();
}

class _UserSideBookingScreenState extends State<UserSideBookingScreen> {
  @override
  Widget build(BuildContext context) {
    UserSideBookingViewModel userSideBookingScreen = UserSideBookingViewModel();
    return ViewModelBuilder<UserSideBookingViewModel>.reactive(
        onModelReady: (model) {
          model.initialize(context);
        },
        viewModelBuilder: () => userSideBookingScreen,
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
                                        color: AppColors.instance.themeColor,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "01",
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
                                      "Step 1",
                                      style: TextStyleUtil.textStyleRaqiBook(
                                          context,
                                          color: AppColors.instance.black),
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
                                        color:
                                            AppColors.instance.backGroundColor,
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
                                                  color: AppColors
                                                      .instance.lightGreyText),
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
                                          color:
                                              AppColors.instance.lightGreyText),
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
                        "Enter Detail Information",
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
                      getNextButton(context, model),
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

  Widget userBookingCardInformation(UserSideBookingViewModel model) {
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
          Text(
            "Date And Time",
            style: TextStyleUtil.textStyleRaqiBook(context, fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Select Date : ',
                      style: TextStyleUtil.textStyleBeforeLoginRaqiBook(context,
                          fontSize: 14)),
                  GestureDetector(
                      onTap: () {
                        DatePicker.showDatePicker(context,
                            minTime: DateTime.now(),
                            maxTime: DateTime(2050, 01, 01),
                            showTitleActions: true, onChanged: (date) {
                          model.updateSelectedDate(date);
                        }, onConfirm: (date) {}, currentTime: DateTime.now());
                      },
                      child: Text(
                        model.selectedDate.day.toString() +
                            "/" +
                            model.selectedDate.month.toString() +
                            "/" +
                            model.selectedDate.year.toString(),
                        style: TextStyleUtil.textStyleBeforeLoginRaqiBook(
                            context,
                            fontSize: 14),
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Select Time : ',
                      style: TextStyleUtil.textStyleBeforeLoginRaqiBook(context,
                          fontSize: 14)),
                  GestureDetector(
                      onTap: () {
                        DatePicker.showTimePicker(
                          context,
                          showTitleActions: true,
                          onChanged: (date) {
                            model.updateSelectedTime(date);
                          },
                          onConfirm: (date) {},
                          currentTime: DateTime.now(),
                        );
                      },
                      child: Text(
                        model.selectedTime.hour.toString() +
                            ":" +
                            model.selectedTime.minute.toString(),
                        style: TextStyleUtil.textStyleBeforeLoginRaqiBook(
                            context,
                            fontSize: 14),
                      )),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Your Address",
            style: TextStyleUtil.textStyleRaqiBook(context, fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsetsDirectional.only(
                start: 10, end: 10, top: 10, bottom: 10),
            decoration: BoxDecoration(
                color: AppColors.instance.white,
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
              controller: model.userAddressField,
              decoration: InputDecoration(
                  icon: Icon(Icons.location_on_outlined),
                  border: InputBorder.none,
                  hintText: "Enter Your Address",
                  hintStyle: TextStyleUtil.textStyleRaqiBook(context,
                      fontSize: 12, color: AppColors.instance.lightGreyText)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              "Use Current Location",
              style: TextStyleUtil.textStyleRaqiBook(
                context,
                color: AppColors.instance.themeColor,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  Widget getNextButton(BuildContext context, UserSideBookingViewModel model) {
    return CupertinoButton(
      color: AppColors.instance.themeColor,
      onPressed: () {
        AppUtils.navigationRoute(
            context: context, route: UserSideBookingSecondScreen());
      },
      borderRadius: BorderRadius.circular(12),
      padding: EdgeInsetsDirectional.only(top: 10, bottom: 10),
      child: Text(
        "Next",
        style: TextStyleUtil.textStyleRaqiBook(context,
            color: AppColors.instance.white, fontSize: 18),
      ),
    );
  }
}
