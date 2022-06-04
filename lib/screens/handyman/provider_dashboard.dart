import 'package:auto_size_text/auto_size_text.dart';
import 'package:caireapp/constants/constants.dart';
import 'package:caireapp/screens/chat/chat_screen.dart';
import 'package:caireapp/screens/providerSideBooking/provider_side_booking_main_screen.dart';
import 'package:caireapp/screens/review/review_screen.dart';
import 'package:caireapp/screens/userBookingMain/booking_screen.dart';
import 'package:caireapp/util/appUtil.dart';
import 'package:caireapp/util/extensionForFontWeight.dart';
import 'package:caireapp/viewmodel/providerDashboard/provider_dashboard_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:stacked/stacked.dart';
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
                appBar: AppUtils.showAppBar(
                    context: context, title: "Caire", showBack: false),
                body: Column(
                  children: [
                    // header(),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            GridView.builder(
                              padding: EdgeInsets.all(12),
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 15.0,
                                      mainAxisSpacing: 15.0,
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
                            Container(
                              padding: const EdgeInsetsDirectional.only(
                                start: 10,
                                end: 10,
                              ),
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
                            // Container(
                            //   color: Colors.grey.withOpacity(0.1),
                            //   padding: EdgeInsets.all(12),
                            //   child: Column(
                            //     children: [
                            //       Row(
                            //         mainAxisAlignment:
                            //             MainAxisAlignment.spaceBetween,
                            //         children: [
                            //           Text(
                            //             'Services',
                            //             style:
                            //                 TextStyleUtil.textStyleRaqiBookBold(
                            //                     context,
                            //                     color:
                            //                         AppColors.instance.black),
                            //           ),
                            //           InkWell(
                            //             onTap: () {
                            //               Navigator.push(
                            //                 context,
                            //                 MaterialPageRoute(
                            //                     builder: (context) =>
                            //                         const ServiceScreen()),
                            //               );
                            //             },
                            //             child: Text(
                            //               'View All',
                            //               style:
                            //                   TextStyleUtil.textStyleRaqiBook(
                            //                       context,
                            //                       color: AppColors
                            //                           .instance.gridBoxColor),
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //       SizedBox(
                            //         height: 12,
                            //       ),
                            //       GridView.builder(
                            //         physics: NeverScrollableScrollPhysics(),
                            //         shrinkWrap: true,
                            //         gridDelegate:
                            //             SliverGridDelegateWithFixedCrossAxisCount(
                            //                 crossAxisCount: 2,
                            //                 crossAxisSpacing: 15.0,
                            //                 mainAxisSpacing: 15.0,
                            //                 childAspectRatio: 0.8),
                            //         itemCount: model.providerList.length,
                            //         itemBuilder: (context, index) {
                            //           return InkWell(
                            //             onTap: () {
                            //               Navigator.push(
                            //                 context,
                            //                 MaterialPageRoute(
                            //                     builder: (context) =>
                            //                         const ChatScreen()),
                            //               );
                            //             },
                            //             child: Container(
                            //               decoration: BoxDecoration(
                            //                 border: Border.all(
                            //                   color: Colors.black,
                            //                 ),
                            //                 borderRadius: BorderRadius.circular(
                            //                     Constants.borderRadiusCard),
                            //               ), // green as background color
                            //               child: Column(
                            //                 children: [
                            //                   ClipRRect(
                            //                     borderRadius: BorderRadius.only(
                            //                       topLeft: Radius.circular(
                            //                           Constants
                            //                               .borderRadiusCard),
                            //                       topRight: Radius.circular(
                            //                           Constants
                            //                               .borderRadiusCard),
                            //                     ),
                            //                     child: Image.network(
                            //                         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTU_phbARGGUeQyPqIBfE6KTNWcjP4lP3IzGQ&usqp=CAU'),
                            //                   ),
                            //                   Text(
                            //                     model.providerList.elementAt(index),
                            //                     style: TextStyleUtil
                            //                         .textStyleRaqiBookBold(
                            //                             context,
                            //                             color: AppColors
                            //                                 .instance.black),
                            //                   ),
                            //                   SizedBox(
                            //                     height: 12,
                            //                   ),
                            //                   Row(
                            //                     mainAxisAlignment:
                            //                         MainAxisAlignment
                            //                             .spaceEvenly,
                            //                     children: [
                            //                       Icon(Icons.phone),
                            //                       Icon(Icons.mail_outline),
                            //                       Icon(Icons.chat),
                            //                     ],
                            //                   ),
                            //                 ],
                            //               ),
                            //             ),
                            //           );
                            //         },
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
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

  Widget userData(StatsModel statsModel) {
    return InkWell(
      onTap: () {
        if (statsModel.description == "Total Bookings") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProviderSideBookingScreen()),
          );
        } else if (statsModel.description == "Total Users") {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) => const ProviderReviewsScreen()),
          // );
        }else if(statsModel.description == "Total Service"){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ServiceScreen()),
          );
        }
      },
      child: Container(
        padding: EdgeInsets.all(12),
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
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
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
      itemCount: 4,
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
