import 'package:auto_size_text/auto_size_text.dart';
import 'package:caireapp/screens/usersidebooking/user_side_booking_second_screen.dart';
import 'package:caireapp/util/appUtil.dart';
import 'package:caireapp/viewmodel/usersidebooking/user_side_booking_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:caireapp/constants/caireColors.dart';
import 'package:caireapp/model/service_data_model.dart';
import 'package:caireapp/util/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:universal_platform/universal_platform.dart';

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
              appBar: AppUtils.showAppBar(context: context,title: "Service Booking",showBack:UniversalPlatform.isWeb? false : true),
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
                                  width: AppUtils.isDesktopDevice(context)
                                      ? 20
                                      : 10,
                                ),
                                dashedHorizontalLine(),
                                SizedBox(
                                  width: AppUtils.isDesktopDevice(context)
                                      ? 20
                                      : 10,
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
            ),
          );
        });
  }

  Widget dashedHorizontalLine() {
    int dottedLines = AppUtils.isDesktopDevice(context) ? 16 : 12;
    return Row(
      children: [
        for (int i = 0; i < dottedLines; i++)
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
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Select Date : ',
                      style: TextStyleUtil.textStyleBeforeLoginRaqiBook(
                        context,
                      )),
                  Container(
                    padding: EdgeInsetsDirectional.all(4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: AppColors.instance.white),
                    child: GestureDetector(
                        onTap: () {
                          DatePicker.showDatePicker(context,
                              minTime: DateTime.now(),
                              maxTime: DateTime(2050, 01, 01),
                              showTitleActions: true,
                              onChanged: (date) {}, onConfirm: (date) {
                            model.updateSelectedDate(date);
                          }, currentTime: DateTime.now());
                        },
                        child: AutoSizeText(
                          AppUtils.showFormattedDate(model.selectedDate),
                          style: TextStyleUtil.textStyleBeforeLoginRaqiBook(
                              context),
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Select Time : ',
                      style:
                          TextStyleUtil.textStyleBeforeLoginRaqiBook(context)),
                  Container(
                    padding: EdgeInsetsDirectional.all(4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: AppColors.instance.white),
                    child: GestureDetector(
                        onTap: () {
                          DatePicker.showTimePicker(
                            context,
                            showTitleActions: true,
                            onChanged: (date) {
                              // model.updateSelectedTime(date);
                            },
                            onConfirm: (date) {
                              model.updateSelectedTime(date);
                            },
                            currentTime: DateTime.now(),
                          );
                        },
                        child: AutoSizeText(
                          AppUtils.showFormattedTime(model.selectedTime),
                          // model.selectedTime.hour.toString() +
                          //     ":" +
                          //     model.selectedTime.minute.toString(),
                          style: TextStyleUtil.textStyleBeforeLoginRaqiBook(
                              context),
                        )),
                  ),
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
        AppUtils.pushRoute(
            context: context,
            route: UserSideBookingSecondScreen(
              servicesData: widget.servicesData,
            ));
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
