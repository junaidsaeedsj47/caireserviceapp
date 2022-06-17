import 'package:auto_size_text/auto_size_text.dart';
import 'package:caireapp/constants/constants.dart';
import 'package:caireapp/screens/chat/chat_screen.dart';
import 'package:caireapp/screens/loginScreen/login_screen.dart';
import 'package:caireapp/screens/providerSideBooking/provider_side_booking_main_screen.dart';
import 'package:caireapp/screens/review/review_screen.dart';
import 'package:caireapp/screens/signUpScreen/signup_screen.dart';
import 'package:caireapp/screens/userBookingMain/booking_screen.dart';
import 'package:caireapp/screens/userProfileOption/user_profile_all_options_screen.dart';
import 'package:caireapp/screens/usersideservices/service_detail_screen.dart';
import 'package:caireapp/util/appUtil.dart';
import 'package:caireapp/util/extensionForFontWeight.dart';
import 'package:caireapp/viewmodel/providerDashboard/provider_dashboard_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:universal_platform/universal_platform.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

import '../../constants/caireColors.dart';
import '../../util/text.dart';
import '../service/service_screen.dart';
import 'handyman_list_screen.dart';

class ProviderDashboardScreen extends StatefulWidget {
  const ProviderDashboardScreen({Key? key}) : super(key: key);

  @override
  _ProviderDashboardScreenState createState() =>
      _ProviderDashboardScreenState();
}

class _ProviderDashboardScreenState extends State<ProviderDashboardScreen> {
  ProviderDashboardViewModel providerDashboardViewModel =
      ProviderDashboardViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ViewModelBuilder<ProviderDashboardViewModel>.reactive(
            onModelReady: (model) {
              model.initialize(context);
            },
            viewModelBuilder: () => providerDashboardViewModel,
            builder: (buildContext, model, index) {
              return Scaffold(
                appBar: MediaQuery.of(context).size.width >= 800 ? null : AppUtils.showAppBar(
                    context: context, title: "Caire", showBack: false),
                body: Column(
                  children: [
                    // header(),
                    if(MediaQuery.of(context).size.width >= 800)
                      getNavbarForWeb(context),
                    // if(MediaQuery.of(context).size.width >= 800)
                    //   Stack(
                    //     children: [
                    //       getCarouselSlider(context, model),
                    //       Positioned.fill(
                    //         child: Align(
                    //           alignment: Alignment.centerLeft,
                    //           child: Container(
                    //               padding: EdgeInsetsDirectional.only(
                    //                   start: 30, end: 30),
                    //               width:
                    //               MediaQuery.of(context).size.width / 2,
                    //               child: getWebSearchField(context)),
                    //
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    if(MediaQuery.of(context).size.width >= 800)
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                          padding: EdgeInsetsDirectional.only(
                              start: 30, end: 30),
                          width:
                          MediaQuery.of(context).size.width /2.5,
                          child: getWebSearchField(context)),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          padding: UniversalPlatform.isWeb
                              ? EdgeInsetsDirectional.only(start: 30, end: 30)
                              : EdgeInsetsDirectional.only(start: 10, end: 10),
                          child: Column(
                            children: [
                              if(MediaQuery.of(context).size.width < 800)
                              const SizedBox(
                                height: 20,
                              ),
                              if(MediaQuery.of(context).size.width < 800)
                              getSearField(context),
                              const SizedBox(
                                height: 15,
                              ),
                              GridView.builder(
                                // padding: EdgeInsets.all(12),
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: UniversalPlatform.isWeb ?4 : 2,
                                        crossAxisSpacing: 20.0,
                                        mainAxisSpacing: 20.0,
                                        childAspectRatio: 1.6),
                                itemCount: model.statsItem.length,
                                itemBuilder: (context, index) {
                                  return userData(
                                      model.statsItem.elementAt(index));
                                },
                              ),

                              // Wrap(
                              //   children: [
                              //     userData(),
                              //     userData(),
                              //     userData(),
                              //     userData(),
                              //   ],
                              // ),

                              // SfCartesianChart(
                              //   // Initialize category axis
                              //     primaryXAxis: CategoryAxis(),
                              //
                              //     series: <LineSeries<SalesData, String>>[
                              //       LineSeries<SalesData, String>(
                              //         // Bind data source
                              //           dataSource:  <SalesData>[
                              //             SalesData('Jan', 35),
                              //             SalesData('Feb', 28),
                              //             SalesData('Mar', 34),
                              //             SalesData('Apr', 32),
                              //             SalesData('May', 40)
                              //           ],
                              //           xValueMapper: (SalesData sales, _) => sales.year,
                              //           yValueMapper: (SalesData sales, _) => sales.sales
                              //       )
                              //     ]
                              // ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                children: [
                                  getSubTitleServices(),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  serviceProviderCard(context, model),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                children: [
                                  getReviewsTitle(model),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  providerReviewsCard(context, model),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }));
  }

  // Container header() {
  //   return Container(
  //     color: AppColors.instance.themeColor,
  //     height: 50,
  //     padding: EdgeInsets.symmetric(horizontal: 20),
  //     width: double.infinity,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Text(
  //           'Home',
  //           style: TextStyle(color: Colors.white),
  //         ),
  //         Icon(
  //           Icons.person,
  //           color: Colors.white,
  //         )
  //       ],
  //     ),
  //   );
  // }
  Widget getNavbarForWeb(BuildContext context) {
    return Container(
      decoration:
      BoxDecoration(color: AppColors.instance.themeColor),
      // height: 70,
      padding:
      EdgeInsetsDirectional.only(start: 30, end: 30, top: 5, bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          getAppLogo(),
          Row(
            children: [
              InkWell(
                onTap: () {
                  AppUtils.pushRoute(context: context, route: ProviderDashboardScreen());
                  AppUtils.moveToDashboard(context, [ProviderDashboardScreen()]);
                },
                child: Text('Home',
                    style: TextStyleUtil.textStyleBeforeLoginRaqiBook(context,
                        fontSize: 20, color: AppColors.instance.white)),
              ),
              SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  AppUtils.pushRoute(context: context, route: ChatScreen());
                  // AppUtils.moveToDashboard(context, [ChatScreen()]);
                },
                child: Text('Chat',
                    style: TextStyleUtil.textStyleBeforeLoginRaqiBook(context,
                        fontSize: 20, color: AppColors.instance.white)),
              ),
              SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  AppUtils.pushRoute(context: context, route: ProviderSideBookingScreen());
                  // AppUtils.moveToDashboard(context, [ProviderSideBookingScreen()]);
                },
                child: Text('Bookings',
                    style: TextStyleUtil.textStyleBeforeLoginRaqiBook(context,
                        fontSize: 20, color: AppColors.instance.white)),
              ),
              SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  AppUtils.pushRoute(context: context, route: NavDrawer());
                  // AppUtils.moveToDashboard(context, [NavDrawer()]);
                },
                child: Text('Profile',
                    style: TextStyleUtil.textStyleBeforeLoginRaqiBook(context,
                        fontSize: 20, color: AppColors.instance.white)),
              ),
              SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  AppUtils.pushRoute(context: context, route: LoginScreen());
                  // AppUtils.moveToDashboard(context, [LoginScreen()]);
                },
                child: Text('Sign in',
                    style: TextStyleUtil.textStyleBeforeLoginRaqiBook(context,
                        fontSize: 20, color: AppColors.instance.white)),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 0.5, color: AppColors.instance.backGroundColor),
                    borderRadius: BorderRadius.circular(5)),
                padding: EdgeInsetsDirectional.only(
                    bottom: 0, top: 0, end: 15, start: 15),
                child: InkWell(
                  onTap: () {
                    AppUtils.pushRoute(context: context, route: SignUpScreen());
                    // AppUtils.moveToDashboard(context, [SignUpScreen()]);
                  },
                  child: Text('Join',
                      style: TextStyleUtil.textStyleBeforeLoginRaqiBook(context,
                          fontSize: 20, color: AppColors.instance.white)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  getAppLogo() {
    return Text(
      'Caire',
      style: TextStyleUtil.textStyleBeforeLoginRaqiBook(context,
          fontSize: UniversalPlatform.isWeb ? Constants.webTitleFontSize : 24,
          color: AppColors.instance.white),
      textAlign: TextAlign.center,
    );
  }

  Widget getWebSearchField(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsetsDirectional.only(top: 0, bottom: 0),
                filled: true,
                fillColor: Colors.white,
                // prefixIconColor: AppColors.instance.themeColor,
                // iconColor: AppColors.instance.themeColor,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),topLeft: Radius.circular(5)),
                  borderSide: BorderSide(
                      color: AppColors.instance.clear, width: 0.0),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.instance.lightGreyText,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),topLeft: Radius.circular(5 )),
                  borderSide: BorderSide(
                      color: AppColors.instance.clear, width: 0.0),
                ),
                // suffixIcon:    CupertinoButton(
                //   color: AppColors.instance.themeColor,
                //   onPressed: () {},
                //   // borderRadius: BorderRadius.circular(10),
                //   // padding: EdgeInsetsDirectional.zero,
                //   child: Text(
                //     "Search",
                //     style: TextStyleUtil.textStyleRaqiBook(context,
                //         color: AppColors.instance.white, fontSize: 20),
                //   ),
                // ),
                suffixIconColor: AppColors.instance.themeColor,
                hintText: "Search services",
                hintStyle: TextStyleUtil.textStyleRaqiBook(
                  context,
                  color: AppColors.instance.lightGreyText,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsetsDirectional.zero,
            width: 100,
            height: 48,
            margin: EdgeInsetsDirectional.zero,
            decoration: BoxDecoration(
              color: AppColors.instance.themeColor,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(5),topRight: Radius.circular(5)),

            ),
            child: GestureDetector(
              onTap: () {},
              child: Center(
                child: Text(
                  "Search",
                  style: TextStyleUtil.textStyleRaqiBook(context,
                      color: AppColors.instance.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget userData(StatsModel statsModel) {
    return InkWell(
      onTap: () {
        if (statsModel.description == "Total Bookings") {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ProviderSideBookingScreen(
                      userFromProvider: true,
                    )),
          );
        } else if (statsModel.description == "Total Users") {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) => const ProviderReviewsScreen()),
          // );
        } else if (statsModel.description == "Total Service") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ServiceScreen()),
          );
        }
      },
      child: Container(
        padding: EdgeInsetsDirectional.only(start: 10, end: 10, top: 10),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade300,
            ),
            borderRadius:
                new BorderRadius.circular(12) // green as background color
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  statsModel.title!,
                  style: TextStyleUtil.textStyleRaqiBookBold(context,
                      color: AppColors.instance.themeColor),
                ),
                statsModel.icon!,
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              statsModel.description!,
              style: TextStyleUtil.textStyleRaqiBookBold(
                context,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getSearField(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsetsDirectional.only(top: 12, bottom: 12),
        filled: true,
        fillColor: Colors.white,
        // prefixIconColor: AppColors.instance.themeColor,
        // iconColor: AppColors.instance.themeColor,
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: AppColors.instance.lightGreyText, width: 0.0),
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: Icon(
          Icons.search,
          color: AppColors.instance.lightGreyText,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: AppColors.instance.lightGreyText, width: 0.0),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: "Search services",
        hintStyle: TextStyleUtil.textStyleRaqiBook(
          context,
          color: AppColors.instance.lightGreyText,
        ),
      ),
    );
  }

  Widget getSubTitleServices() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "My Services",
          style: TextStyleUtil.textStyleRaqiBook(context,
              fontWeight: AppFontWeight.bold, fontSize: 20),
        ),
        GestureDetector(
          onTap: () {
            AppUtils.pushRoute(context: context, route: ServiceScreen());
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
      BuildContext context, ProviderDashboardViewModel model) {
    return Container(
      height: 220,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: model.servicesData.length,
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
              child: Container(
                // width:customWidth,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.instance.backGroundColor),
                margin: EdgeInsetsDirectional.only(end: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Stack(
                      children: [
                        Container(
                          // width:  AppUtils.isDesktopDevice(context)? 300 : double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: 160,
                          width: 270,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                topLeft: Radius.circular(15)),
                            child: Image.network(
                              model.servicesData[index].serviceImage.toString(),
                              fit: BoxFit.fill,
                            ),
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
                    Container(
                      padding:
                          const EdgeInsetsDirectional.only(start: 20, end: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // SizedBox(
                          //   height: 20,
                          // ),
                          // Row(
                          //   children: [
                          //     getRatingStars(
                          //         model,
                          //         index,
                          //         model.servicesData[index]
                          //             .serviceProviderRating!),
                          //     SizedBox(
                          //       width: 5,
                          //     ),
                          //     Text(
                          //       model.servicesData[index].serviceProviderRating
                          //           .toString(),
                          //       style: TextStyleUtil.textStyleRaqiBook(context),
                          //     ),
                          //   ],
                          // ),
                          SizedBox(
                            height: 20,
                          ),
                          AutoSizeText(
                            model.servicesData[index].serviceName!,
                            maxLines: 2,
                            style: TextStyleUtil.textStyleRaqiBook(context,
                                fontWeight: AppFontWeight.bold, fontSize: 16),
                          ),
                          // SizedBox(
                          //   height: 20,
                          // ),
                          // Row(
                          //   children: [
                          //     Icon(Icons.account_circle),
                          //     SizedBox(
                          //       width: 5,
                          //     ),
                          //     AutoSizeText(
                          //       model.servicesData[index].serviceProviderName!,
                          //       style: TextStyleUtil.textStyleRaqiBook(context,
                          //           color: AppColors.instance.lightGreyText),
                          //     ),
                          //   ],
                          // )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget getRatingStars(
      ProviderDashboardViewModel model, int index, double ratingNo) {
    List starToShow = [];
    if (ratingNo == 1 || ratingNo < 2) {
      starToShow = [1];
      // debugPrint('starToShow' + starToShow.toString());
    } else if (ratingNo == 2 || ratingNo < 3) {
      starToShow = [1, 2];
      // debugPrint('starToShow' + starToShow.toString());
    } else if (ratingNo == 3 || ratingNo < 4) {
      starToShow = [1, 2, 3];
      // debugPrint('starToShow' + starToShow.toString());
    } else if (ratingNo == 4 || ratingNo < 5) {
      starToShow = [1, 2, 3, 4];
      // debugPrint('starToShow' + starToShow.toString());
    } else {
      starToShow = [1, 2, 3, 4, 5];
      // debugPrint('starToShow' + starToShow.toString());
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

  Widget getPriceTag(ProviderDashboardViewModel model, int index) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.instance.white, width: 2),
            color: AppColors.instance.themeColor,
            borderRadius: BorderRadius.circular(18)),
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
              start: 12, end: 12, top: 5, bottom: 5),
          child: Text(
            AppUtils.getAppCurrency() +
                model.servicesData[index].servicePricing.toString(),
            style: TextStyleUtil.textStyleRaqiBook(context,
                color: AppColors.instance.textWhiteColor),
          ),
        ));
  }

  Widget getReviewsTitle(ProviderDashboardViewModel model) {
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
                context: context, route: ProviderReviewsScreen());
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
      BuildContext context, ProviderDashboardViewModel model) {
    return ListView.builder(
      itemCount: 2,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemBuilder: (context, i) {
        return _reviewContainer();
      },
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: AutoSizeText(
                            'Lorem ipsum dolor sit amet consectetur adipisicing elit',
                            style: TextStyleUtil.textStyleRaqiBook(context,
                                color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          '02 Dec',
                          style: TextStyleUtil.textStyleRaqiBookBold(context,
                              color: Colors.grey, fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Row(
                      children: [
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
                      ],
                    ),
                    Container(
                      // height: 33,
                      // width: 200,
                      child: Text(
                        'John',
                        style: TextStyleUtil.textStyleRaqiBookBold(context,
                            color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Divider()
        ],
      ),
    );
  }
}
