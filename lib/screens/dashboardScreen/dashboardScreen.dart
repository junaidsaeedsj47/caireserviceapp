import 'package:auto_size_text/auto_size_text.dart';
import 'package:caireapp/constants/caireColors.dart';
import 'package:caireapp/constants/constants.dart';
import 'package:caireapp/device/device.dart';
import 'package:caireapp/screens/categories/viewall_categories_screen.dart';
import 'package:caireapp/screens/chat/chat_screen.dart';
import 'package:caireapp/screens/loginScreen/login_screen.dart';
import 'package:caireapp/screens/signUpScreen/signup_screen.dart';
import 'package:caireapp/screens/userBookingMain/booking_screen.dart';
import 'package:caireapp/screens/userProfileOption/user_profile_all_options_screen.dart';
import 'package:caireapp/screens/usersideservices/service_detail_screen.dart';
import 'package:caireapp/screens/usersideservices/viewall_services_screen.dart';
import 'package:caireapp/util/appUtil.dart';
import 'package:caireapp/util/enum.dart';
import 'package:caireapp/util/extensionForFontWeight.dart';
import 'package:caireapp/util/text.dart';
import 'package:caireapp/viewmodel/dashboard_viewmodel/dashboard_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:stacked/stacked.dart';
import 'package:universal_platform/universal_platform.dart';

class DashboardScreen extends StatefulWidget {
  final UserType userType;

  DashboardScreen({this.userType = UserType.LoggedIn});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    DashboardViewModel dashboardScreenViewModel = DashboardViewModel();
    return ViewModelBuilder<DashboardViewModel>.reactive(
        onModelReady: (model) {
          model.initialize(context);
        },
        viewModelBuilder: () => dashboardScreenViewModel,
        builder: (contextBuilder, model, child) {
          return ResponsiveWrapper.builder(
              SafeArea(
                child: Scaffold(
                  appBar: MediaQuery.of(context).size.width >= 800
                      ? null
                      : AppUtils.showAppBar(
                          context: context, title: "Caire", showBack: false),
                  body: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (MediaQuery.of(context).size.width >= 800)
                          getNavbarForWeb(context),
                        if (MediaQuery.of(context).size.width >= 800)
                          Stack(
                            children: [
                              getCarouselSlider(context, model),
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                      padding: EdgeInsetsDirectional.only(
                                          start: 30, end: 30),
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: getWebSearchField(context)),
                                ),
                              )
                            ],
                          ),
                        if (MediaQuery.of(context).size.width < 800)
                          getCarouselSlider(context, model),
                        Container(
                          padding: UniversalPlatform.isWeb
                              ? EdgeInsetsDirectional.only(start: 30, end: 30)
                              : EdgeInsetsDirectional.only(start: 10, end: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              if (MediaQuery.of(context).size.width < 800)
                                const SizedBox(
                                  height: 20,
                                ),
                              if (MediaQuery.of(context).size.width < 800)
                                getSearField(context),
                              const SizedBox(
                                height: 20,
                              ),
                              getSubTitleCategories(),
                              const SizedBox(
                                height: 20,
                              ),
                              getCategoriesList(context, model),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: MediaQuery.of(context).size.width >= 800
                              ? EdgeInsetsDirectional.only(
                                  start: 30, end: 30, top: 20, bottom: 70)
                              : EdgeInsetsDirectional.only(
                                  start: 10, end: 10, top: 20, bottom: 70),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              AppColors.instance.themeColor,
                              AppColors.instance.splashColorThree,
                            ],
                          )),
                          child: Column(
                            children: [
                              getSubTitleServices(),
                              const SizedBox(
                                height: 20,
                              ),
                              serviceProviderCard(context, model),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // bottomNavigationBar: AppUtils.appBottomBar(context),
                  // bottomNavigationBar: BottomNavigationBar(
                  //     showSelectedLabels: false,
                  //     showUnselectedLabels: false,
                  //     items: <BottomNavigationBarItem>[
                  //       BottomNavigationBarItem(
                  //         activeIcon: Icon(
                  //           Icons.home,
                  //           color: AppColors.instance.themeColor,
                  //         ),
                  //         icon: Icon(
                  //           Icons.home,
                  //           color: AppColors.instance.appIconColor,
                  //         ),
                  //         label: 'Home',
                  //       ),
                  //       BottomNavigationBarItem(
                  //           activeIcon: Icon(
                  //             Icons.chat,
                  //             color: AppColors.instance.themeColor,
                  //           ),
                  //           icon: Icon(
                  //             Icons.chat,
                  //             color: AppColors.instance.appIconColor,
                  //           ),
                  //           label: 'Chat',
                  //           backgroundColor: Colors.yellow),
                  //       BottomNavigationBarItem(
                  //         activeIcon: Icon(
                  //           Icons.notifications,
                  //           color: AppColors.instance.themeColor,
                  //         ),
                  //         icon: Icon(
                  //           Icons.notifications,
                  //           color: AppColors.instance.appIconColor,
                  //         ),
                  //         label: 'Notification',
                  //         backgroundColor: Colors.blue,
                  //       ),
                  //       BottomNavigationBarItem(
                  //         activeIcon: Icon(
                  //           Icons.person,
                  //           color: AppColors.instance.themeColor,
                  //         ),
                  //         icon: Icon(
                  //           Icons.person,
                  //           color: AppColors.instance.appIconColor,
                  //         ),
                  //         label: 'Profile',
                  //         backgroundColor: Colors.blue,
                  //       ),
                  //     ],
                  //     type: BottomNavigationBarType.fixed,
                  //     currentIndex: model.selectedIndex,
                  //     selectedItemColor: AppColors.instance.appIconColor,
                  //     iconSize: 25,
                  //     onTap: (index){
                  //       model.onItemTapped(index);
                  //       if(index==0){
                  //         AppUtils.pushRoute(context: context, route: DashboardScreen());
                  //       }else if( index==1){
                  //         AppUtils.pushRoute(context: context, route: ChatScreen());
                  //       }else if(index==2){
                  //         AppUtils.pushRoute(context: context, route: DashboardScreen());
                  //       }else if(index==3){
                  //         AppUtils.pushRoute(context: context, route: DashboardScreen());
                  //       }
                  //     },
                  //     elevation: 5),
                ),
              ),
              // maxWidth:700,
              // minWidth: 480,
              // defaultScale: true,
              breakpoints: [
                ResponsiveBreakpoint.resize(480, name: MOBILE),
                ResponsiveBreakpoint.autoScale(800, name: TABLET),
                ResponsiveBreakpoint.resize(1000, name: DESKTOP),
              ],
              background: Container(color: Color(0xFFF5F5F5)));
        });
  }

  Widget getNavbarForWeb(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.instance.themeColor),
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
                  AppUtils.pushRoute(context: context, route: DashboardScreen());
                  // AppUtils.moveToDashboard(context, [DashboardScreen]);
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
                  // AppUtils.moveToDashboard(context, [ChatScreen()]);
                  AppUtils.pushRoute(context: context, route: ChatScreen());
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
                  AppUtils.pushRoute(context: context, route: BookingMainScreen());
                  // AppUtils.moveToDashboard(context, [BookingMainScreen()]);
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
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      topLeft: Radius.circular(5)),
                  borderSide:
                      BorderSide(color: AppColors.instance.clear, width: 0.0),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.instance.lightGreyText,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      topLeft: Radius.circular(5)),
                  borderSide:
                      BorderSide(color: AppColors.instance.clear, width: 0.0),
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
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(5),
                  topRight: Radius.circular(5)),
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

  Widget getCarouselSlider(BuildContext context, DashboardViewModel model) {
    return CarouselSlider(
      options: CarouselOptions(
        disableCenter: true,
        aspectRatio: AppUtils.isDesktopDevice(context) ? 16 / 8 : 16 / 10,
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

  Widget getSubTitleCategories() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Categories",
          style: TextStyleUtil.textStyleRaqiBook(context,
              fontWeight: AppFontWeight.bold, fontSize: 20),
        ),
        GestureDetector(
          onTap: () {
            AppUtils.pushRoute(
                context: context,
                route: ViewAllCategoriesScreen(
                  userType: widget.userType,
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

  Widget getCategoriesList(BuildContext context, DashboardViewModel model) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: model.lisOfCategories.take(6).length,
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(UniversalPlatform.isWeb ? 8 : 12),
            border: Border.all(color: Colors.grey)),
        child: GestureDetector(
          onTap: () {
            AppUtils.pushRoute(
                context: context,
                route: ViewAllServicesScreen(
                  userType: widget.userType,
                  title: model.lisOfCategories[index],
                ));
          },
          child: Column(
            children: [
              Expanded(
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12)),
                        color: AppColors.instance.backGroundColor),
                    child: const Icon(
                      Icons.home_repair_service,
                      color: Colors.black,
                    )),
              ),
              SizedBox(
                height: 5,
              ),
              Text(model.lisOfCategories[index],
                  style:
                      TextStyleUtil.textStyleRaqiBook(context, fontSize: 14)),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: UniversalPlatform.isWeb ? 1.5 : 1.1,
        crossAxisCount: AppUtils.isDesktopDevice(context) ? 3 : 2,
        mainAxisSpacing: UniversalPlatform.isWeb ? 30 : 20,
        crossAxisSpacing: UniversalPlatform.isWeb ? 30 : 15,
        // childAspectRatio:,
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
        GestureDetector(
          onTap: () {
            AppUtils.pushRoute(
                context: context,
                route: ViewAllServicesScreen(
                  userType: widget.userType,
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

  Widget serviceProviderCard(BuildContext context, DashboardViewModel model) {
    // double customWidth;
    // double customHeight;
    // if(AppUtils.isDesktopDevice(context)){
    //   customWidth = MediaQuery.of(context).size.width/4;
    //   customHeight=MediaQuery.of(context).size.height/1.5;
    // }else if(AppUtils.isTabletDevice(context)){
    //   customWidth= MediaQuery.of(context).size.width/3;
    //   customHeight=600;
    // }else{
    //   customWidth= MediaQuery.of(context).size.width/1.5;
    //       customHeight=400;
    // }
    return Container(
      height: 300,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount:  model.servicesData.length,
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
              child: Container(
                // width:customWidth,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
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
                          height:  160,
                          width: 270,
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
                    Container(
                      padding:
                          const EdgeInsetsDirectional.only(start: 20, end: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              getRatingStars(
                                  model,
                                  index,
                                  model.servicesData[index]
                                      .serviceProviderRating!),
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
                          SizedBox(
                            height: 20,
                          ),
                          AutoSizeText(
                            model.servicesData[index].serviceName!,
                            maxLines: 2,
                            style: TextStyleUtil.textStyleRaqiBook(context,
                                fontWeight: AppFontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Icon(Icons.account_circle),
                              SizedBox(
                                width: 5,
                              ),
                              AutoSizeText(
                                model.servicesData[index].serviceProviderName!,
                                style: TextStyleUtil.textStyleRaqiBook(context,
                                    color: AppColors.instance.lightGreyText),
                              ),
                            ],
                          )
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

  Widget getRatingStars(DashboardViewModel model, int index, double ratingNo) {
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

  Widget getPriceTag(DashboardViewModel model, int index) {
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
}
