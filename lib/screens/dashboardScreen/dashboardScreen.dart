import 'package:caireapp/constants/caireColors.dart';
import 'package:caireapp/device/device.dart';
import 'package:caireapp/util/appUtil.dart';
import 'package:caireapp/util/extensionForFontWeight.dart';
import 'package:caireapp/util/text.dart';
import 'package:caireapp/viewmodel/dashboardscreen_viewmodel/dashboard_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    DashboardViewModel dashboardScreenViewModel = DashboardViewModel();
    return SafeArea(
        child: ViewModelBuilder<DashboardViewModel>.reactive(
            onModelReady: (model) {
              model.initialize(context);
            },
            viewModelBuilder: () => dashboardScreenViewModel,
            builder: (contextBuilder, model, child) {
              return Scaffold(
                appBar: AppBar(
                  title: Text(
                    "Caire",
                    style: TextStyleUtil.textStyleRaqiBook(context),
                  ),
                  automaticallyImplyLeading: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: AppColors.instance.themeColor, // Status bar
                  ),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      getCarouselSlider(context, model),
                      Container(
                        padding: EdgeInsetsDirectional.only(start: 10, end: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
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
                        padding: const EdgeInsetsDirectional.only(
                            start: 10, end: 10, top: 10, bottom: 10),
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
            }));
  }

  Widget getSearField(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        prefixIconColor: AppColors.instance.themeColor,
        iconColor: AppColors.instance.themeColor,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 0.0),
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: Icon(
          Icons.search,
          color: AppColors.instance.appIconColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 0.0),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: "Search services",
        hintStyle: TextStyleUtil.textStyleRaqiBook(context),
      ),
    );
  }

  Widget getCarouselSlider(BuildContext context, DashboardViewModel model) {
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

  Widget getSubTitleCategories() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Categories",
          style: TextStyleUtil.textStyleRaqiBook(context,
              fontWeight: AppFontWeight.bold),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            "View All",
            style: TextStyleUtil.textStyleRaqiBook(context),
          ),
        ),
      ],
    );
  }

  Widget getCategoriesList(BuildContext context, DashboardViewModel model) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: model.lisOfCategories.length,
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey)),
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
                style: TextStyleUtil.textStyleRaqiBook(context, fontSize: 14)),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
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
              fontWeight: AppFontWeight.bold),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            "View All",
            style: TextStyleUtil.textStyleRaqiBook(context),
          ),
        ),
      ],
    );
  }

  Widget serviceProviderCard(BuildContext context, DashboardViewModel model) {
    return Container(
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: model.servicesData.length,
          itemBuilder: (context, int index) {
            return Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsetsDirectional.only(end: 20),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 150,
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
                  RatingBar.builder(
                    ignoreGestures: false,
                    itemSize: 20,
                    initialRating: model.servicesData[index].serviceProviderRating!,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    unratedColor: Colors.white,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) =>
                        Image.asset("assets/images/goldenStar.png"),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget getPriceTag(DashboardViewModel model, int index) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.instance.white,width: 2),
            color: AppColors.instance.themeColor,
            borderRadius: BorderRadius.circular(18)),
        child: Padding(
          padding: const EdgeInsetsDirectional.only(start: 12,end: 12,top: 5,bottom: 5),
          child: Text(
            AppUtils.getAppCurrency() + model.servicesData[index].servicePricing.toString(),
            style: TextStyleUtil.textStyleRaqiBook(context,
                color: AppColors.instance.textWhiteColor),
          ),
        ));
  }
}
