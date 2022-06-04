import 'package:caireapp/constants/caireColors.dart';
import 'package:caireapp/model/service_data_model.dart';
import 'package:caireapp/screens/chat/chatDetailScreen.dart';
import 'package:caireapp/util/appUtil.dart';
import 'package:caireapp/util/extensionForFontWeight.dart';
import 'package:caireapp/util/text.dart';
import 'package:caireapp/viewmodel/bookingProgressDetails/booking_progress_details_viewmodel.dart';
import 'package:caireapp/widgets/custom_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:universal_platform/universal_platform.dart';
import 'check_user_booking_status.dart';
class BookingProgressDetailsScreen extends StatefulWidget {
  final ServiceModel? servicesData;
  final DateTime? selectedDate;
  final DateTime? selectedTime;

  BookingProgressDetailsScreen(
      {Key? key, this.servicesData, this.selectedTime, this.selectedDate});

  @override
  _BookingProgressDetailsScreenState createState() =>
      _BookingProgressDetailsScreenState();
}

class _BookingProgressDetailsScreenState
    extends State<BookingProgressDetailsScreen> {
  BookingProgressDetailsViewModel bookingProgressDetailsViewModel =
  BookingProgressDetailsViewModel();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ViewModelBuilder<BookingProgressDetailsViewModel>.reactive(
          onModelReady: (model) {
            model.initialize(context);
          },
          viewModelBuilder: () => bookingProgressDetailsViewModel,
          builder: (contextBuilder, model, child) {
            return Scaffold(
              appBar: AppUtils.showAppBarWithAction(
                showBack: true,
                title: "Pending",
                titleFontSize: 20,
                centerTitle: false,
                context: context,
                actionWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 20),
                      child: GestureDetector(
                        child: Text(
                          'Check Status',
                          style: TextStyleUtil.textStyleRaqiBook(context!,
                              fontSize: 20,
                              color: AppColors.instance.textWhiteColor),
                        ),
                        onTap: () {
                          AppUtils.pushRoute(
                              context: context, route: CheckUserBookingStatus());
                        },
                      ),
                    ),
                  ],
                ),
              ),
              backgroundColor: Colors.white,
              // body:     MapSample(),
              body: Container(
                padding: UniversalPlatform.isWeb
                    ? EdgeInsetsDirectional.only(start: 30, end: 30)
                    : EdgeInsetsDirectional.only(
                        top: 20, bottom: 20, start: 20, end: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      getBookingTransactionId(context),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(
                        thickness: 0.8,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      serviceBookingDetails(context),
                      SizedBox(
                        height: 20,
                      ),
                      getTheServiceDuration(context),
                      SizedBox(
                        height: 20,
                      ),
                      serviceProviderDetails(context),
                      SizedBox(
                        height: 40,
                      ),
                      cancelBookingButton(context)
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget getBookingTransactionId(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Booking ID :",
          style: TextStyleUtil.textStyleRaqiBook(
            context,
          ),
        ),
        Text(
          "1233",
          style: TextStyleUtil.textStyleRaqiBook(
            context,
            color: AppColors.instance.themeColor,
          ),
        ),
      ],
    );
  }

  Widget serviceBookingDetails(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(widget.servicesData!=null)
            Text(
              widget.servicesData!.serviceName ?? "",
              style: TextStyleUtil.textStyleRaqiBook(context, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Date : ",
                  style: TextStyleUtil.textStyleRaqiBook(context),
                ),
                if(widget.selectedDate!=null)
                Text(
                  AppUtils.showFormattedDateWithMonthName(widget.selectedDate!),
                  style: TextStyleUtil.textStyleRaqiBook(context,
                      color: AppColors.instance.lightGreyText),
                )
              ],
            ),
            SizedBox(
              height: 7,
            ),
            Row(
              children: [
                Text(
                  "Time : ",
                  style: TextStyleUtil.textStyleRaqiBook(context),
                ),
                if(widget.selectedTime!=null)
                Text(
                  AppUtils.showFormattedTime(widget.selectedTime!),
                  style: TextStyleUtil.textStyleRaqiBook(context,
                      color: AppColors.instance.lightGreyText),
                )
              ],
            ),
          ],
        ),
        Container(
            width: 80,
            height: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                widget.servicesData?.serviceImage ?? "",
                fit: BoxFit.cover,
              ),
            )),
      ],
    );
  }

  Widget getTheServiceDuration(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Duration :",
        style: TextStyleUtil.textStyleRaqiBook(context, fontSize: 18),
      ),
      SizedBox(
        height: 10,
      ),
      Container(
        padding: AppUtils.unifiedPaddingOfScreen(
            start: 20, end: 20, top: 20, bottom: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.instance.backGroundColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Service Taken Time : ",
              style: TextStyleUtil.textStyleRaqiBook(context),
            ),
            Text(
              "35 Min",
              style: TextStyleUtil.textStyleRaqiBook(context,
                  fontSize: 14, color: AppColors.instance.lightGreyText),
            ),
          ],
        ),
      ),
    ]);
  }

  Widget serviceProviderDetails(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "About Provider",
        style: TextStyleUtil.textStyleRaqiBook(context, fontSize: 18),
      ),
      SizedBox(
        height: 10,
      ),
      Container(
        padding: AppUtils.unifiedPaddingOfScreen(
            start: 20, end: 20, top: 20, bottom: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.instance.backGroundColor),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: 80,
                    height: 80,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                            'https://preview.keenthemes.com/metronic-v4/theme/assets/pages/media/profile/profile_user.jpg'),
                      ),
                    )),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if(widget.servicesData?.serviceProviderName!=null)
                    Text(
                      widget.servicesData!.serviceProviderName ?? "",
                      style: TextStyleUtil.textStyleRaqiBook(context,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    if(widget.servicesData?.serviceName!=null)
                    Text(
                      widget.servicesData!.serviceName ?? "",
                      style: TextStyleUtil.textStyleRaqiBook(context,
                          color: AppColors.instance.lightGreyText),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    if(widget.servicesData?.serviceProviderRating!=null)
                    getRatingStars(
                        context, widget.servicesData!.serviceProviderRating),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: CupertinoButton(
                    color: AppColors.instance.themeColor,
                    onPressed: () {
                      AppUtils.pop(context: context);
                    },
                    borderRadius: BorderRadius.circular(12),
                    padding: EdgeInsetsDirectional.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.call,
                          color: AppColors.instance.white,
                          size: 18,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          "Call",
                          style: TextStyleUtil.textStyleRaqiBook(context,
                              fontSize: 18, color: AppColors.instance.white),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: CupertinoButton(
                    color: AppColors.instance.white,
                    onPressed: () {
                      AppUtils.pushRoute(
                          context: context, route: ChattingDetailScreen());
                    },
                    borderRadius: BorderRadius.circular(12),
                    padding: EdgeInsetsDirectional.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.chat,
                          color: AppColors.instance.black,
                          size: 18,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          "Chat",
                          style: TextStyleUtil.textStyleRaqiBook(context,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ]);
  }

  Widget getRatingStars(BuildContext context, double? ratingNo) {
    List starToShow = [];
    if (ratingNo == 1 || ratingNo! < 2) {
      starToShow = [1];
      debugPrint('starToShow' + starToShow.toString());
    } else if (ratingNo == 2 || ratingNo! < 3) {
      starToShow = [1, 2];
      debugPrint('starToShow' + starToShow.toString());
    } else if (ratingNo == 3 || ratingNo! < 4) {
      starToShow = [1, 2, 3];
      debugPrint('starToShow' + starToShow.toString());
    } else if (ratingNo == 4 || ratingNo! < 5) {
      starToShow = [1, 2, 3, 4];
      debugPrint('starToShow' + starToShow.toString());
    } else {
      starToShow = [1, 2, 3, 4, 5];
      debugPrint('starToShow' + starToShow.toString());
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: starToShow
              .map((e) => Padding(
                    padding: const EdgeInsetsDirectional.only(end: 5),
                    child: Image.asset(
                      "assets/images/goldenStar.png",
                      fit: BoxFit.cover,
                      width: 16,
                    ),
                  ))
              .toList(),
        ),
        Text(
          ratingNo.toString() ?? "",
          style: TextStyleUtil.textStyleRaqiBook(context,
              fontSize: 14,
              color: AppColors.instance.lightGreyText,
              fontWeight: AppFontWeight.medium),
        ),
      ],
    );
  }

  Widget cancelBookingButton(BuildContext context) {
    return CupertinoButton(
      color: AppColors.instance.themeColor,
      onPressed: () {
        cancelBookingShowDialog(context);
      },
      borderRadius: BorderRadius.circular(12),
      padding: EdgeInsetsDirectional.only(top: 10, bottom: 10),
      child: Text(
        "Cancel Booking",
        style: TextStyleUtil.textStyleRaqiBook(context,
            fontSize: 18, color: AppColors.instance.white),
      ),
    );
  }
   cancelBookingShowDialog(BuildContext context){
    return    showDialog(
        context: context,
        builder: (contextBuilder) => ShowPopup(
          title: "Warning!",
          description: "Do you want to cancel the booking?",
          actions: [
            AppAlertAction(
              title: "Yes",
              handler: (_) {
                AppUtils.pop(context: context);
                AppUtils.pop(context: context);
                AppUtils.pop(context: context);
                AppUtils.pop(context: context);
              },
              showWhiteButton: false,
            ),
            AppAlertAction(
              title: "Cancel",
              showWhiteButton: true,
            ),
          ],
          // image: Image.asset(MobilyConstants.baseImagePath + "common/info.png"),
        ),
        barrierDismissible: true);
  }

}