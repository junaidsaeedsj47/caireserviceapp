import 'package:caireapp/screens/dashboardScreen/dashboardScreen.dart';
import 'package:caireapp/util/appUtil.dart';
import 'package:caireapp/util/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:stacked/stacked.dart';

import '../../constants/caireColors.dart';
import '../../viewmodel/booking/booking_screen_viewmodel.dart';
import '../../viewmodel/service/service_screen_viewmodel.dart';
import '../../widgets/caire_fields.dart';
import 'add_service_screen.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  ServiceScreenViewModel serviceScreenViewModel = ServiceScreenViewModel();
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ViewModelBuilder<ServiceScreenViewModel>.reactive(
          onModelReady: (model) {
            model.initialize(context);
          },
          viewModelBuilder: () => serviceScreenViewModel,
          builder: (contextBuilder, model, child) {
            return Scaffold(
              appBar: AppUtils.showAppBarWithAction(
                showBack: true,
                title: "All Services",
                context: context,
                actionWidget:   IconButton(
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            AppUtils.pushRoute(
                                context: context, route: AddServiceScreen());
                          },
                        ),
              ),
              backgroundColor: Colors.white,
              body: Column(
                children: [
                  // Container(
                  //   height: 60,
                  //   width: double.infinity,
                  //   color: AppColors.instance.themeColor,
                  //   child: Padding(
                  //     padding:
                  //         const EdgeInsetsDirectional.only(start: 30, end: 30),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         IconButton(
                  //           icon: Icon(
                  //             Icons.arrow_back_ios,
                  //             color: Colors.white,
                  //           ),
                  //           onPressed: () {
                  //             AppUtils.pop(context: context);
                  //           },
                  //         ),
                  //         Align(
                  //           alignment: Alignment.center,
                  //           child: Text(
                  //             'Service List',
                  //             style: TextStyleUtil.textStyleRaqiBookBold(
                  //                 context,
                  //                 color: Colors.white,
                  //                 fontSize: 18),
                  //             textAlign: TextAlign.center,
                  //           ),
                  //         ),
                  //         IconButton(
                  //           icon: Icon(
                  //             Icons.add,
                  //             color: Colors.white,
                  //           ),
                  //           onPressed: () {
                  //             AppUtils.pushRoute(
                  //                 context: context, route: AddServiceScreen());
                  //           },
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: DynamicSize.height(0.1, context),
                  // ),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Container(
                            height: 55,
                            margin: const EdgeInsetsDirectional.only(
                              start: 20,
                              end: 20,
                            ),
                            child: CarieTextFieldWithoutLabel(
                              fillColor: Colors.grey.withOpacity(0.2),
                              controller: searchController,
                              hintText: 'Search here',
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(bottom: 2.0),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                ),
                              ),
                              hintStyle:
                                  TextStyleUtil.textStyleRaqiBook(context),
                            ),
                          ),
                          SizedBox(height: 10),
                          ListView.builder(
                            itemCount: 6,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, i) {
                              return _serviceContainer(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }

  Container _serviceContainer(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(start: 20, end: 20, bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
                child: Container(
                  height: 110,
                  width: 110,
                  child: Image.network(
                    'https://intero-integrity.s3.amazonaws.com/prod/images/_576x432_crop_center-center_30_line/Pipe-freezing-2.jpg?mtime=20190529155913&focal=none&tmtime=20201208134541',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Chip(
                padding: EdgeInsets.zero,

                backgroundColor: AppColors.instance.themeColor,
                shadowColor: Colors.black,
                label: Text(
                  '\$130',
                  style: TextStyleUtil.textStyleRaqiBookBold(context,
                      fontSize: 11, color: Colors.white),
                ), //Text
              ),
            ],
          ),
          SizedBox(
            width: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              Text(
                'Fixing Smart Devices',
                style:
                    TextStyleUtil.textStyleRaqiBookBold(context, fontSize: 12),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundImage: NetworkImage(
                        'https://preview.keenthemes.com/metronic-v4/theme/assets/pages/media/profile/profile_user.jpg'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'John doe',
                    style: TextStyleUtil.textStyleRaqiBook(context,
                        fontSize: 15, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
