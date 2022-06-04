import 'package:caireapp/constants/caireColors.dart';
import 'package:caireapp/screens/chat/chatDetailScreen.dart';
import 'package:caireapp/screens/paymentDetails/payment_details_screen.dart';
import 'package:caireapp/screens/provider_side_service_completed.dart';
import 'package:caireapp/screens/userSideReview/user_side_review_screen.dart';
import 'package:caireapp/util/appUtil.dart';
import 'package:caireapp/util/text.dart';
import 'package:caireapp/viewmodel/bookingProgressDetails/check_status_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:universal_platform/universal_platform.dart';

class CheckUserBookingStatus extends StatefulWidget {
  final bool providerSideScreen;
  const CheckUserBookingStatus({Key? key,this.providerSideScreen=false}) : super(key: key);

  @override
  _CheckUserBookingStatusState createState() => _CheckUserBookingStatusState();
}

class _CheckUserBookingStatusState extends State<CheckUserBookingStatus> {
  CheckBookingStatusViewModel checkBookingStatusViewModel =
      CheckBookingStatusViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ViewModelBuilder<CheckBookingStatusViewModel>.reactive(
          onModelReady: (model) {
            model.initialize(context);
          },
          viewModelBuilder: () => checkBookingStatusViewModel,
          builder: (contextBuilder, model, child) {
            return Scaffold(
              appBar: AppUtils.showAppBarWithAction(
                showBack: true,
                title: "In Progress",
                centerTitle: false,
                context: context,
                actionWidget: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 20),
                      child: GestureDetector(
                        onTap: () {
                          // AppUtils.pushRoute(
                          //     context: context, route: ChattingDetailScreen());
                        },
                        child: Icon(
                          Icons.call,
                          color: AppColors.instance.textWhiteColor,
                          size: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 20),
                      child: GestureDetector(
                        onTap: () {
                          AppUtils.pushRoute(
                              context: context, route: ChattingDetailScreen());
                        },
                        child: Icon(
                          Icons.chat,
                          color: AppColors.instance.textWhiteColor,
                          size: 20,
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsetsDirectional.only(end: 20),
                    //   child: GestureDetector(
                    //     child: Text(
                    //       'Check Status',
                    //       style: TextStyleUtil.textStyleRaqiBook(context!,
                    //           fontSize: 20,
                    //           color: AppColors.instance.textWhiteColor),
                    //     ),
                    //     onTap: () {
                    //       // AppUtils.pushRoute(
                    //       //     context: context, route: CheckUserBookingStatus());
                    //     },
                    //   ),
                    // ),
                  ],
                ),
              ),
              backgroundColor: Colors.white,
              // body:     MapSample(),
              body: Container(

                child: SingleChildScrollView(
                  child: Column(

                    children: [
                      Container(
                        // width: 100,
                        height: MediaQuery.of(context).size.height / 1.8,
                        child: GoogleMap(
                          mapType: MapType.normal,
                          initialCameraPosition: model.kGooglePlex,
                          onMapCreated: (GoogleMapController controller) {
                            model.controller.complete(controller);
                          },
                        ),
                      ),
                      // SizedBox(
                      //   height: 5,
                      // ),
                      // getBookingTransactionId(context),
                      // SizedBox(
                      //   height: 5,
                      // ),
                      // Divider(
                      //   thickness: 0.8,
                      // ),
                     Container(
                       padding: UniversalPlatform.isWeb
                           ? EdgeInsetsDirectional.only(start: 30, end: 30)
                           : EdgeInsetsDirectional.only(
                           top: 20, bottom: 20, start: 20, end: 20),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.stretch,
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           getTheServiceDuration(context),
                           SizedBox(
                             height: 20,
                           ),
                           completeBookingButton(context)
                         ],
                       ),
                     )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget getTheServiceDuration(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Booking Details :",
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Booking ID :",
                  style: TextStyleUtil.textStyleRaqiBook(context),
                ),
                Text(
                  "1233",
                  style: TextStyleUtil.textStyleRaqiBook(context,
                      color: AppColors.instance.lightGreyText),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Estimated Arrival Time : ",
                  style: TextStyleUtil.textStyleRaqiBook(context),
                ),
                Text(
                  "40 Min",
                  style: TextStyleUtil.textStyleRaqiBook(context,
                      color: AppColors.instance.lightGreyText),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Service Completion Time : ",
                  style: TextStyleUtil.textStyleRaqiBook(context),
                ),
                Text(
                  "2 Hrs",
                  style: TextStyleUtil.textStyleRaqiBook(context,
                      color: AppColors.instance.lightGreyText),
                ),
              ],
            ),
          ],
        ),
      ),
    ]);
  }

  Widget completeBookingButton(BuildContext context) {
    return CupertinoButton(
      color: AppColors.instance.themeColor,
      onPressed: () {
        if(widget.providerSideScreen){
          AppUtils.pushRoute(context: context, route: ProviderSideServiceCompleted(providerCompletingService: true,));
        }else{
          AppUtils.pushRoute(context: context, route: PaymentDetailsScreen());
        }

      },
      borderRadius: BorderRadius.circular(12),
      padding: EdgeInsetsDirectional.only(top: 10, bottom: 10),
      child: Text(
        "Complete Booking",
        style: TextStyleUtil.textStyleRaqiBook(context,
            fontSize: 18, color: AppColors.instance.white),
      ),
    );
  }
}
