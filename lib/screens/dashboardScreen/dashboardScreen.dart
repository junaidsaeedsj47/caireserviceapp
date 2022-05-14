import 'package:caireapp/constants/caireColors.dart';
import 'package:caireapp/device/device.dart';
import 'package:caireapp/util/text.dart';
import 'package:caireapp/viewmodel/dashboardscreen_viewmodel/dashboard_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:stacked/stacked.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

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
                  title: Text("Caire",style:TextStyleUtil.textStyleRaqiBook(context),),
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
                      getCarouselSlider(context),
                      Container(
                        padding: EdgeInsetsDirectional.only(start: 10, end: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            getSearField(context),
                            SizedBox(
                              height: 20,
                            ),
                            getSubTitleCategories(),
                            SizedBox(
                              height: 20,
                            ),
                            getCategoriesList(context),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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
          prefixIcon: Icon(Icons.search),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 0.0),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: "Search services",hintStyle: TextStyleUtil.textStyleRaqiBook(context),),
    );
  }

  Widget getCarouselSlider(BuildContext context) {
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
      items: imgList.map((images) {
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
        Text("Services",style: TextStyleUtil.textStyleRaqiBook(context),),
        GestureDetector(
          onTap: () {},
          child: Text("See All",style: TextStyleUtil.textStyleRaqiBook(context),),
        ),
      ],
    );
  }

  Widget getCategoriesList(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 6,
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
                      borderRadius: BorderRadius.only(
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
            Text('Service Name',style: TextStyleUtil.textStyleRaqiBook(context),),
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
}
