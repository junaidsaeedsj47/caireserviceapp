import 'package:auto_size_text/auto_size_text.dart';
import 'package:caireapp/screens/bookingProgressDetails/booking_progress_details_screen.dart';
import 'package:caireapp/util/appUtil.dart';
import 'package:caireapp/viewmodel/usersidebooking/userside_booking_second_viewmodel.dart';
import 'package:caireapp/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:caireapp/constants/caireColors.dart';
import 'package:caireapp/model/service_data_model.dart';
import 'package:caireapp/util/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:universal_platform/universal_platform.dart';

class UserSideBookingSecondScreen extends StatefulWidget {
  final ServiceModel? servicesData;
  final DateTime? selectedTime;
  final DateTime? selectedDate;

  UserSideBookingSecondScreen(
      {Key? key, this.servicesData, this.selectedDate, this.selectedTime});

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
              appBar: AppUtils.showAppBar(
                  context: context,
                  title: "Confirm Service Booking",
                  showBack: UniversalPlatform.isWeb ? false : true),
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
                        height: 20,
                      ),
                      userBookingServiceInformation(model),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Price Details",
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
                          SizedBox(
                            width: 5,
                          ),
                          getNextButton(context, model),
                        ],
                      )
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

  Widget userBookingServiceInformation(UserSideBookingSecondViewModel model) {
    return Container(
      padding: AppUtils.unifiedPaddingOfScreen(
          start: 20, end: 20, top: 20, bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.instance.backGroundColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          selectedServiceName(),
          Container(
              width: 70,
              // height: 50,
              child: Image.network(
                widget.servicesData?.serviceImage ?? "",
                fit: BoxFit.cover,
              )),
        ],
      ),
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
          getLabelAndAmount(label: "Discount", price: "-\$50"),
          Divider(),
          getLabelAndAmount(label: "Tax", price: "\$100"),
          Divider(),
          getTotalAmount(label: "Total Amount", price: "\$500"),
        ],
      ),
    );
  }

  Widget selectedServiceName() {
    return AutoSizeText(widget.servicesData?.serviceName ?? '',
        style: TextStyleUtil.textStyleRaqiBook(
          context,
        ));
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
        color: AppColors.instance.backGroundColor,
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
          AppUtils.pushRoute(
              context: context,
              route: BookingProgressDetailsScreen(
                servicesData: widget.servicesData,
                selectedDate: widget.selectedDate,
                selectedTime: widget.selectedTime,
              ));
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
