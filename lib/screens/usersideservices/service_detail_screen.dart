import 'package:auto_size_text/auto_size_text.dart';
import 'package:caireapp/constants/caireColors.dart';
import 'package:caireapp/constants/constants.dart';
import 'package:caireapp/model/service_data_model.dart';
import 'package:caireapp/screens/providerDetails/provider_detail_screens.dart';
import 'package:caireapp/screens/usersidebooking/user_side_booking_screen.dart';
import 'package:caireapp/util/appUtil.dart';
import 'package:caireapp/util/extensionForFontWeight.dart';
import 'package:caireapp/util/text.dart';
import 'package:caireapp/viewmodel/usersideservices/service_detail_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:universal_platform/universal_platform.dart';

class ServiceDetailScreen extends StatefulWidget {
  final ServiceModel? servicesData;

  ServiceDetailScreen({Key? key, this.servicesData});

  @override
  _ServiceDetailScreenState createState() => _ServiceDetailScreenState();
}

class _ServiceDetailScreenState extends State<ServiceDetailScreen> {
  @override
  Widget build(BuildContext context) {
    ServiceDetailsViewModel serviceDetailsViewModel = ServiceDetailsViewModel();
    return ViewModelBuilder<ServiceDetailsViewModel>.reactive(
        onModelReady: (model) {
          model.initialize(context);
        },
        viewModelBuilder: () => serviceDetailsViewModel,
        builder: (contextBuilder, model, child) {
          return Scaffold(
            appBar: AppUtils.showAppBar(context: context,title: "Service Details",showBack:UniversalPlatform.isWeb? false : true),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    fit: StackFit.loose,
                    // overflow: Overflow.visible,
                    alignment: Alignment.bottomCenter,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 90),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: double.infinity,
                          height: 400,
                          child: Image.network(
                            widget.servicesData!.serviceImage.toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned.fill(
                          child: Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    top: 50, end: 40),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.instance.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: const EdgeInsets.all(6.0),
                                  child: Icon(
                                    Icons.thumb_up_alt_outlined,
                                    color: AppColors.instance.appIconColor,
                                  ),
                                ),
                              ))),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(
                              start: 20, end: 20),
                          child: serviceDetailsCard(context, model),
                        ),
                      )
                      // Positioned.fill(
                      //   // bottom: -300,
                      //    top: 0,
                      //     child: Padding(
                      //       padding: const EdgeInsetsDirectional.only(
                      //           start: 20, end: 20),
                      //       child: ,
                      //     ))
                    ],
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.only(start: 20, end: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage(
                                      'https://preview.keenthemes.com/metronic-v4/theme/assets/pages/media/profile/profile_user.jpg'),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  widget.servicesData!.serviceProviderName ??
                                      "",
                                  style:
                                      TextStyleUtil.textStyleRaqiBook(context),
                                ),
                              ],
                            ),
                            CupertinoButton(
                              // color: AppColors.instance.themeColor,
                              onPressed: () {
                                AppUtils.pushRoute(
                                    context: context,
                                    route: ProviderDetailsScreen(
                                      servicesData: widget.servicesData,
                                    ));
                              },
                              padding: EdgeInsetsDirectional.only(
                                top: 10,
                                bottom: 10,
                              ),
                              child: Text(
                                "View Profile",
                                style: TextStyleUtil.textStyleRaqiBook(context,
                                    color: AppColors.instance.themeColor,
                                    fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Description",
                          style: TextStyleUtil.textStyleRaqiBook(context),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AutoSizeText(
                          widget.servicesData!.descriptionOfService ?? "",
                          style: TextStyleUtil.textStyleRaqiBook(context,
                              color: AppColors.instance.lightGreyText),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Available At",
                          style: TextStyleUtil.textStyleRaqiBook(context),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        getContinueButton(context, model),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget serviceDetailsCard(
      BuildContext context, ServiceDetailsViewModel model) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: AppColors.instance.white,
          borderRadius: BorderRadius.circular(20)),
      padding:
          EdgeInsetsDirectional.only(top: 20, bottom: 20, start: 20, end: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.servicesData!.serviceName ?? "",
            style: TextStyleUtil.textStyleRaqiBook(context, fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          getPriceAndDiscount(),
          SizedBox(
            height: 20,
          ),
          getDurationValue(),
          SizedBox(
            height: 20,
          ),
          getRatingValue(),
        ],
      ),
    );
  }

  Widget getPriceAndDiscount() {
    String showDiscount = '';
    if (widget.servicesData!.serviceDiscount != null) {
      showDiscount =
          widget.servicesData!.serviceDiscount.toString() + '\%' + " off";
    }
    return Row(
      children: [
        Text(
          AppUtils.getAppCurrency() +
              widget.servicesData!.servicePricing.toString(),
          style: TextStyleUtil.textStyleRaqiBook(context,
              color: AppColors.instance.themeColor,
              fontWeight: AppFontWeight.bold),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          showDiscount ?? "",
          style: TextStyleUtil.textStyleRaqiBook(context,
              fontSize: 14,
              color: AppColors.instance.lightGreyText,
              fontWeight: AppFontWeight.medium),
        ),
      ],
    );
  }

  Widget getDurationValue() {
    String showDuration = '';
    if (widget.servicesData!.serviceDuration != null) {
      showDuration = widget.servicesData!.serviceDuration.toString() + " Hour";
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Duration :",
          style: TextStyleUtil.textStyleRaqiBook(context, fontSize: 14),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          showDuration ?? "",
          style: TextStyleUtil.textStyleRaqiBook(
            context,
            fontSize: 14,
            color: AppColors.instance.themeColor,
          ),
        ),
      ],
    );
  }

  Widget getRatingValue() {
    String showDuration = '';
    if (widget.servicesData!.serviceProviderRating != null) {
      showDuration = widget.servicesData!.serviceProviderRating.toString();
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Rating :",
          style: TextStyleUtil.textStyleRaqiBook(context, fontSize: 14),
        ),
        SizedBox(
          width: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              Constants.assetsFolderPath + "goldenStar.png",
              width: 14,
            ),
            SizedBox(
              width: 3,
            ),
            Text(
              showDuration ?? "",
              style: TextStyleUtil.textStyleRaqiBook(context,
                  fontSize: 14,
                  color: AppColors.instance.lightGreyText,
                  fontWeight: AppFontWeight.medium),
            ),
          ],
        ),
      ],
    );
  }

  Widget getContinueButton(
      BuildContext context, ServiceDetailsViewModel model) {
    return CupertinoButton(
      color: AppColors.instance.themeColor,
      onPressed: () {
        AppUtils.pushRoute(
            context: context, route: UserSideBookingScreen(servicesData: widget.servicesData,));
      },
      borderRadius: BorderRadius.circular(12),
      padding: EdgeInsetsDirectional.only(top: 10, bottom: 10),
      child: Text(
        "Continue",
        style: TextStyleUtil.textStyleRaqiBook(context,
            color: AppColors.instance.white, fontSize: 18),
      ),
    );
  }
}
