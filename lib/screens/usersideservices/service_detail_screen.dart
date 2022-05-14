import 'package:auto_size_text/auto_size_text.dart';
import 'package:caireapp/constants/caireColors.dart';
import 'package:caireapp/constants/constants.dart';
import 'package:caireapp/model/service_data_model.dart';
import 'package:caireapp/util/appUtil.dart';
import 'package:caireapp/util/extensionForFontWeight.dart';
import 'package:caireapp/util/text.dart';
import 'package:caireapp/viewmodel/services/service_detail_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

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
                          height: 400,
                          child: Image.network(
                            widget.servicesData!.serviceImage.toString(),
                            fit: BoxFit.fill,
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
            style: TextStyleUtil.textStyleRaqiBook(context),
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
      onPressed: () {},
      borderRadius: BorderRadius.circular(12),
      padding: EdgeInsetsDirectional.only(top: 10, bottom: 10),
      child: Text(
        "Continue",
        style: TextStyleUtil.textStyleRaqiBook(context,
            color: AppColors.instance.white,fontSize: 18),
      ),
    );
  }
}
