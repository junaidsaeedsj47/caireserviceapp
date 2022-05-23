import 'package:caireapp/screens/booking/booking_screen.dart';
import 'package:caireapp/screens/chat/chat_screen.dart';
import 'package:caireapp/screens/review/review_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

import '../../constants/caireColors.dart';
import '../../util/text.dart';
import '../service/service_screen.dart';
import 'handyman_list_screen.dart';

class ProviderDashboardScreen extends StatefulWidget {
  const ProviderDashboardScreen({Key ?key}) : super(key: key);

  @override
  _ProviderDashboardScreenState createState() =>
      _ProviderDashboardScreenState();
}

class _ProviderDashboardScreenState extends State<ProviderDashboardScreen> {
  List<StatsModel> statsItem = [
    StatsModel(
      title: '12',
      description: 'Total Bookings',
      icon: Icon(Icons.book),
    ),
    StatsModel(
      title: '2',
      description: 'Total Service',
      icon: Icon(Icons.shopping_bag_outlined),
    ),
    StatsModel(
      title: '4',
      description: 'Total Users',
      icon: Icon(Icons.supervised_user_circle_sharp),
    ),
    StatsModel(
      title: '\$2300',
      description: 'Total Earnings',
      icon: Icon(Icons.monetization_on_sharp),
    ),
  ];

  List<String> providerList = [
    'John',
    'Alex',
    'Abraham',
    'Aley',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            header(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GridView.builder(
                      padding: EdgeInsets.all(12),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15.0,
                          mainAxisSpacing: 15.0,
                          childAspectRatio: 1.6),
                      itemCount: statsItem.length,
                      itemBuilder: (context, index) {
                        return userData(statsItem.elementAt(index));
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
                      color: Colors.grey.withOpacity(0.1),
                      padding: EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Services',
                                style: TextStyleUtil.textStyleRaqiBookBold(context,
                                    color: AppColors.instance.black),
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const ServiceScreen()),
                                  );
                                },
                                child: Text(
                                  'View All',
                                  style: TextStyleUtil.textStyleRaqiBook(context,
                                      color: AppColors.instance.gridBoxColor),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12,),
                          GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 15.0,
                              mainAxisSpacing: 15.0,
                              childAspectRatio: 0.8
                            ),
                            itemCount: providerList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const ChatScreen()),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                      borderRadius: new BorderRadius.only(
                                        topLeft: const Radius.circular(20.0),
                                        topRight: const Radius.circular(20.0),
                                        bottomRight: const Radius.circular(20.0),
                                        bottomLeft: const Radius.circular(20.0),
                                      ) // green as background color
                                  ),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: new BorderRadius.only(
                                          topLeft: const Radius.circular(20.0),
                                          topRight: const Radius.circular(20.0),
                                        ),
                                        child: Image.network(
                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTU_phbARGGUeQyPqIBfE6KTNWcjP4lP3IzGQ&usqp=CAU'),
                                      ),
                                      Text(
                                        providerList.elementAt(index),
                                        style: TextStyleUtil.textStyleRaqiBookBold(context,
                                          color: AppColors.instance.black),
                                      ),
                                      SizedBox(height: 12,),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(Icons.phone),
                                          Icon(Icons.mail_outline),
                                          Icon(Icons.chat),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container header() {
    return Container(
      color: AppColors.instance.themeColor,
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Home',
            style: TextStyle(color: Colors.white),
          ),
          Icon(Icons.person,
          color:
            Colors.white,)
        ],
      ),
    );
  }

  Widget userData(StatsModel statsModel) {


    return InkWell(
      onTap: (){
        if(statsModel.description=="Total Bookings")
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BookingScreen()),
            );
          }

          else if(statsModel.description=="Total Users")
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ReviewScreen()),
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
}

class StatsModel {
  final String? title;
  final Icon? icon;
  final String? description;

  StatsModel({this.title, this.icon, this.description});
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}