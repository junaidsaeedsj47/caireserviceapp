import 'package:auto_size_text/auto_size_text.dart';
import 'package:caireapp/constants/caireColors.dart';
import 'package:caireapp/model/service_data_model.dart';
import 'package:caireapp/screens/review/review_screen.dart';
import 'package:caireapp/screens/usersideservices/service_detail_screen.dart';
import 'package:caireapp/screens/usersideservices/viewall_services_screen.dart';
import 'package:caireapp/util/appUtil.dart';
import 'package:caireapp/util/extensionForFontWeight.dart';
import 'package:caireapp/util/text.dart';
import 'package:caireapp/viewmodel/providerDetails/provider_details_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:universal_platform/universal_platform.dart';

class ProviderDetailsScreen extends StatefulWidget {
  final String? title;
  final ServiceModel? servicesData;

  ProviderDetailsScreen({Key? key, this.title, this.servicesData});

  @override
  _ProviderDetailsScreenState createState() => _ProviderDetailsScreenState();
}

class _ProviderDetailsScreenState extends State<ProviderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    ProviderDetailsViewModel providerDetailsViewModel =
        ProviderDetailsViewModel();
    return SafeArea(
        child: ViewModelBuilder<ProviderDetailsViewModel>.reactive(
            onModelReady: (model) {
              model.initialize(context);
            },
            viewModelBuilder: () => providerDetailsViewModel,
            builder: (contextBuilder, model, child) {
              return Scaffold(
                appBar:  AppUtils.showAppBar(
                    context: context,
                    title: "Provider Detail",
                    showBack: UniversalPlatform.isWeb ? false : true),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      userProfileNameTitle(context, model),
                      Container(
                        padding: const EdgeInsetsDirectional.only(
                            start: 10, end: 10, top: 20, bottom: 20),
                        child: Column(
                          children: [
                            // SizedBox(
                            //   height: 30,
                            // ),
                            getAboutSummary(context, model),
                            SizedBox(
                              height: 30,
                            ),
                            getContactDetails(context, model),

                          ],
                        ),
                      ),

                      Container(
                        padding: const EdgeInsetsDirectional.only(
                            start: 10, end: 10, ),
                        child: Column(
                          children: [
                            getSubTitleServices(model),
                            const SizedBox(
                              height: 20,
                            ),
                            serviceProviderCard(context, model),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsetsDirectional.only(
                          start: 10, end: 10,),
                        child: Column(
                          children: [
                            getReviewsTitle(model),
                            const SizedBox(
                              height: 20,
                            ),
                            providerReviewsCard(context, model),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }

  Widget userProfileNameTitle(
      BuildContext context, ProviderDetailsViewModel model) {
    return Container(
      padding: const EdgeInsetsDirectional.only(
          start: 10, end: 10, top: 20, bottom: 20),
      color: AppColors.instance.textWhiteColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
            // width: 50,
            child: CircleAvatar(
              radius: 50,
              child: Image.network(
                  'https://preview.keenthemes.com/metronic-v4/theme/assets/pages/media/profile/profile_user.jpg',),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.providerDetails.first.providerName ?? "",
                style: TextStyleUtil.textStyleRaqiBook(context, fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                model.providerDetails.first.providerJobTitle ?? "",
                style: TextStyleUtil.textStyleRaqiBook(context,
                    fontSize: 14,
                    color: AppColors.instance.lightGreyText,
                    fontWeight: AppFontWeight.medium),
              ),
              SizedBox(
                height: 10,
              ),
              getRatingStars(
                  context, model, model.providerDetails.first.providerRating),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: EdgeInsetsDirectional.all(2.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  20,
                ),
                color: Colors.green,
              ),
              child: Icon(
                Icons.check,
                color: AppColors.instance.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getAboutSummary(BuildContext context, ProviderDetailsViewModel model) {
    return Container(
      padding: const EdgeInsetsDirectional.only(
          start: 20, end: 20,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("About",   style: TextStyleUtil.textStyleRaqiBook(
            context,
          )),
          SizedBox(
            height: 20,
          ),
          AutoSizeText(model.providerDetails.first.userSummaryDetails ?? "",
              style: TextStyleUtil.textStyleRaqiBook(
                context,
                fontSize: 14,
                color: AppColors.instance.lightGreyText,
                // fontWeight: AppFontWeight.medium,
              )),
        ],
      ),
    );
  }

  Widget getContactDetails(
      BuildContext context, ProviderDetailsViewModel model) {
    return Container(
      padding: const EdgeInsetsDirectional.only(
          start: 20, end: 20, top: 30, bottom: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.instance.textWhiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Email",   style: TextStyleUtil.textStyleRaqiBook(
            context,
          )),
          SizedBox(
            height: 5,
          ),
          Text(model.providerDetails.first.providerEmail ?? "",
              style: TextStyleUtil.textStyleRaqiBook(
                context,
                fontSize: 14,
                color: AppColors.instance.lightGreyText,
                // fontWeight: AppFontWeight.medium,
              )),
          SizedBox(
            height: 20,
          ),
          Text("Number",   style: TextStyleUtil.textStyleRaqiBook(
            context,
          )),
          SizedBox(
            height: 5,
          ),
          Text(model.providerDetails.first.providerPhoneNumber ?? "",
              style: TextStyleUtil.textStyleRaqiBook(
                context,
                fontSize: 14,
                color: AppColors.instance.lightGreyText,
                // fontWeight: AppFontWeight.medium,
              )),
          SizedBox(
            height: 20,
          ),
          Text("Member Since",   style: TextStyleUtil.textStyleRaqiBook(
            context,
          )),
          SizedBox(
            height: 5,
          ),
          Text(model.providerDetails.first.providerMemberSince ?? "",
              style: TextStyleUtil.textStyleRaqiBook(
                context,
                fontSize: 14,
                color: AppColors.instance.lightGreyText,
                fontWeight: AppFontWeight.medium,
              )),
        ],
      ),
    );
  }
  Widget getReviewsTitle(ProviderDetailsViewModel model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Reviews",
          style: TextStyleUtil.textStyleRaqiBook(context,
              fontWeight: AppFontWeight.bold, fontSize: 20),
        ),
        GestureDetector(
          onTap: () {
            AppUtils.pushRoute(
                context: context,
                route: ProviderReviewsScreen(
                ));
          },
          child: Text(
            "View All",
            style: TextStyleUtil.textStyleRaqiBook(context,
                color: AppColors.instance.lightGreyText),
          ),
        ),
      ],
    );
  }

  Widget providerReviewsCard(
      BuildContext context, ProviderDetailsViewModel model) {
    return Container(
      // height: 300,
      child:   ListView.builder(
        itemCount: 1,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, i) {
          return _reviewContainer();
        },
      ),
    );
  }
  Widget _reviewContainer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    'https://preview.keenthemes.com/metronic-v4/theme/assets/pages/media/profile/profile_user.jpg'),
              ),
              SizedBox(
                width: 25,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'John',
                        style: TextStyleUtil.textStyleRaqiBookBold(context,
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.4,
                      ),
                      Text(
                        '02 Dec',
                        style: TextStyleUtil.textStyleRaqiBookBold(context,
                            color: Colors.grey, fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Row(children: [
                    RatingBar.builder(
                      initialRating: 3.5,
                      minRating: 1,
                      itemSize: 15,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      '3.5',
                      style: TextStyleUtil.textStyleRaqiBookBold(context,
                          fontSize: 13, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ],),
                  Container(
                    // height: 33,
                    width:200,
                    child: Text(
                      'Lorem ipsum dolor sit amet consectetur adipisicing elit',
                      style: TextStyleUtil.textStyleRaqiBookBold(context,

                          color: Colors.grey),
                      overflow: TextOverflow.ellipsis,

                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              )
            ],
          ),
          Divider()
        ],
      ),
    );
  }
  Widget getRatingStars(
      BuildContext context, ProviderDetailsViewModel model, double? ratingNo) {
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: starToShow
              .map((e) => Padding(
                    padding: const EdgeInsetsDirectional.only(end: 5),
                    child: Image.asset(
                      "assets/images/goldenStar.png",
                      fit: BoxFit.cover,
                      width: 20,
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

    // return ListView.builder(
    //     itemCount: 3,
    //     itemBuilder: (BuildContext context, int index) {
    //       return Image.asset("assets/images/goldenStar.png}");
    //     });
  }

  Widget getSubTitleServices(ProviderDetailsViewModel model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Services",
          style: TextStyleUtil.textStyleRaqiBook(context,
              fontWeight: AppFontWeight.bold, fontSize: 20),
        ),
        GestureDetector(
          onTap: () {
            AppUtils.pushRoute(
                context: context,
                route: ViewAllServicesScreen(
                  servicesData: widget.servicesData,
                ));
          },
          child: Text(
            "View All",
            style: TextStyleUtil.textStyleRaqiBook(context,
                color: AppColors.instance.lightGreyText),
          ),
        ),
      ],
    );
  }

  Widget serviceProviderCard(
      BuildContext context, ProviderDetailsViewModel model) {
    return Container(
      // height: 300,
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: model.servicesData.take(1).length,
          itemBuilder: (context, int index) {
            return GestureDetector(
              onTap: () {
                AppUtils.pushRoute(
                    context: context,
                    route: ServiceDetailScreen(
                      userFromViewProfile: true,
                      servicesData: model.servicesData[index],
                    ));
              },
              child: Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 20),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.instance.backGroundColor),
                  // margin: EdgeInsetsDirectional.only(end: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            // height: 150,
                            child: Image.network(
                              model.servicesData[index].serviceImage.toString(),
                              fit: BoxFit.fill,
                            ),
                          ),
                          Positioned.fill(
                              child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        end: 15, bottom: 15),
                                    child: getPriceTag(model, index),
                                  ))),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(start: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.,
                          children: [
                            getRatingStars(
                                context,
                                model,
                                model.servicesData[index]
                                    .serviceProviderRating!),
                            // RatingBar.builder(
                            //   ignoreGestures: false,
                            //   itemSize: 15,
                            //   initialRating:
                            //       model.servicesData[index].serviceProviderRating!,
                            //   minRating: 1,
                            //   direction: Axis.horizontal,
                            //   allowHalfRating: false,
                            //   itemCount: 5,
                            //   unratedColor: Colors.transparent,
                            //   itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            //   itemBuilder: (context, _) =>
                            //       Image.asset("assets/images/goldenStar.png"),
                            //   onRatingUpdate: (rating) {
                            //     print(rating);
                            //   },
                            // ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              model.servicesData[index].serviceProviderRating
                                  .toString(),
                              style: TextStyleUtil.textStyleRaqiBook(context),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(start: 20),
                        child: Text(
                          model.servicesData[index].serviceName!,
                          style: TextStyleUtil.textStyleRaqiBook(context,
                              fontWeight: AppFontWeight.bold, fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 20),
                        child: Row(
                          children: [
                            Icon(Icons.account_circle),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              model.servicesData[index].serviceProviderName!,
                              style: TextStyleUtil.textStyleRaqiBook(context,
                                  color: AppColors.instance.lightGreyText),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget getPriceTag(ProviderDetailsViewModel model, int index) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.instance.white, width: 2),
            color: AppColors.instance.themeColor,
            borderRadius: BorderRadius.circular(18)),
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
              start: 15, end: 15, top: 5, bottom: 5),
          child: Text(
            AppUtils.getAppCurrency() +
                model.servicesData[index].servicePricing.toString(),
            style: TextStyleUtil.textStyleRaqiBook(context,
                color: AppColors.instance.textWhiteColor),
          ),
        ));
  }
}
