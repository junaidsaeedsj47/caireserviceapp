import 'package:caireapp/constants/caireColors.dart';
import 'package:caireapp/model/service_data_model.dart';
import 'package:caireapp/screens/categories/viewall_categories_screen.dart';
import 'package:caireapp/screens/usersideservices/service_detail_screen.dart';
import 'package:caireapp/util/appUtil.dart';
import 'package:caireapp/util/enum.dart';
import 'package:caireapp/util/extensionForFontWeight.dart';
import 'package:caireapp/util/text.dart';
import 'package:caireapp/viewmodel/usersideservices/viewall_services_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:stacked/stacked.dart';
import 'package:universal_platform/universal_platform.dart';

class ViewAllServicesScreen extends StatefulWidget {
  final String? title;
  final ServiceModel? servicesData;
  final UserType userType;

  ViewAllServicesScreen(
      {Key? key,
      this.title,
      this.servicesData,
      this.userType = UserType.LoggedIn});

  @override
  _ViewAllServicesScreenState createState() => _ViewAllServicesScreenState();
}

class _ViewAllServicesScreenState extends State<ViewAllServicesScreen> {
  @override
  Widget build(BuildContext context) {
    ViewAllServicesViewModel viewAllServicesViewModel =
        ViewAllServicesViewModel();
    return SafeArea(
        child: ViewModelBuilder<ViewAllServicesViewModel>.reactive(
            onModelReady: (model) {
              model.initialize(context);
            },
            viewModelBuilder: () => viewAllServicesViewModel,
            builder: (contextBuilder, model, child) {
              return Scaffold(
                appBar: AppUtils.showAppBar(
                  title: widget.title ?? "Services",
                  context: context,
                  showBack: UniversalPlatform.isWeb ? false : true,
                ),
                body: SingleChildScrollView(
                  child: Container(
                    padding: UniversalPlatform.isWeb
                        ? EdgeInsetsDirectional.only(start: 30, end: 30)
                        : EdgeInsetsDirectional.only(start: 10, end: 10),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              start: 10, end: 10, top: 20),
                          child: getSearchFieldFilter(context),
                        ),
                        Container(
                          padding: const EdgeInsetsDirectional.only(
                              start: 10, end: 10, top: 20, bottom: 20),
                          child: Column(
                            children: [
                              getSubTitleServices(),
                              const SizedBox(
                                height: 20,
                              ),
                              AppUtils.isDesktopDevice(context)
                                  ? getWebServicesListCard(context, model)
                                  : serviceProviderCard(context, model),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }

  Widget getSearchFieldFilter(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsetsDirectional.only(top: 12, bottom: 12),
              filled: true,
              fillColor: Colors.white,
              // prefixIconColor: AppColors.instance.themeColor,
              // iconColor: AppColors.instance.themeColor,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: AppColors.instance.lightGreyText, width: 0.0),
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: Icon(
                Icons.search,
                color: AppColors.instance.lightGreyText,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: AppColors.instance.lightGreyText, width: 0.0),
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: "Search here...",
              hintStyle: TextStyleUtil.textStyleRaqiBook(
                context,
                color: AppColors.instance.lightGreyText,
              ),
            ),
          ),
        ),
        // SizedBox(width: 10,),
        // Container(
        //     decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(10),
        //         color: AppColors.instance.themeColor),
        //     padding: EdgeInsetsDirectional.all(4.0),
        //     child: IconButton(
        //         onPressed: () {}, icon: Icon(Icons.filter_alt_outlined,color: AppColors.instance.textWhiteColor,)))
      ],
    );
  }

  Widget getCarouselSlider(
      BuildContext context, ViewAllServicesViewModel model) {
    return CarouselSlider(
      options: CarouselOptions(
        disableCenter: true,
        // aspectRatio: 16 / 9,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        // enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
      items: model.imgList.map((images) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {},
              child: Image.network(
                images,
                fit: BoxFit.fill,
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget getWebServicesListCard(
      BuildContext context, ViewAllServicesViewModel model) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: model.servicesData.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          AppUtils.pushRoute(
              context: context,
              route: ServiceDetailScreen(
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
                      getRatingStars(model, index,
                          model.servicesData[index].serviceProviderRating!),
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
                      CircleAvatar(
                        radius: 15,
                        backgroundImage: NetworkImage(
                            'https://preview.keenthemes.com/metronic-v4/theme/assets/pages/media/profile/profile_user.jpg'),
                      ),
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
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: 0.85,
      ),
    );
  }

  Widget getSubTitleServices() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Services",
          style: TextStyleUtil.textStyleRaqiBook(context,
              fontWeight: AppFontWeight.bold, fontSize: 20),
        ),
        // GestureDetector(
        //   onTap: () {},
        //   child: Text(
        //     "View All",
        //     style: TextStyleUtil.textStyleRaqiBook(context,
        //         color: AppColors.instance.lightGreyText),
        //   ),
        // ),
      ],
    );
  }

  Widget serviceProviderCard(
      BuildContext context, ViewAllServicesViewModel model) {
    return Container(
      // height: 300,
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: model.servicesData.length,
          itemBuilder: (context, int index) {
            return GestureDetector(
              onTap: () {
                AppUtils.pushRoute(
                    context: context,
                    route: ServiceDetailScreen(
                      userType: widget.userType,
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
                          ClipRRect(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),),
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
                                model,
                                index,
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
                            CircleAvatar(
                              radius: 15,
                              backgroundImage: NetworkImage(
                                  'https://preview.keenthemes.com/metronic-v4/theme/assets/pages/media/profile/profile_user.jpg'),
                            ),
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

  Widget getRatingStars(
      ViewAllServicesViewModel model, int index, double ratingNo) {
    List starToShow = [];
    if (ratingNo == 1 || ratingNo < 2) {
      starToShow = [1];
      debugPrint('starToShow' + starToShow.toString());
    } else if (ratingNo == 2 || ratingNo < 3) {
      starToShow = [1, 2];
      debugPrint('starToShow' + starToShow.toString());
    } else if (ratingNo == 3 || ratingNo < 4) {
      starToShow = [1, 2, 3];
      debugPrint('starToShow' + starToShow.toString());
    } else if (ratingNo == 4 || ratingNo < 5) {
      starToShow = [1, 2, 3, 4];
      debugPrint('starToShow' + starToShow.toString());
    } else {
      starToShow = [1, 2, 3, 4, 5];
      debugPrint('starToShow' + starToShow.toString());
    }
    return Row(
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
    );

    // return ListView.builder(
    //     itemCount: 3,
    //     itemBuilder: (BuildContext context, int index) {
    //       return Image.asset("assets/images/goldenStar.png}");
    //     });
  }

  Widget getPriceTag(ViewAllServicesViewModel model, int index) {
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
