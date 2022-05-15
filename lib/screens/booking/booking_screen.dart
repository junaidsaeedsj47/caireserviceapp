import 'package:caireapp/screens/dashboardScreen/dashboardScreen.dart';
import 'package:caireapp/util/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../constants/caireColors.dart';
import '../../viewmodel/booking/booking_screen_viewmodel.dart';
import '../handyman/handyman_list_screen.dart';
import '../service/service_screen.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  BookingViewModel bookingViewModel = BookingViewModel();
  String dropdownValue = 'Pending';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ViewModelBuilder<BookingViewModel>.reactive(
          onModelReady: (model) {
            model.initialize(context);
          },
          viewModelBuilder: () => bookingViewModel,
          builder: (contextBuilder, model, child) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: Column(
                children: [
                  Container(
                    height: 60,
                    width: double.infinity,
                    color: AppColors.instance.themeColor,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(start: 30),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Booking',
                          style: TextStyleUtil.textStyleRaqiBookBold(context,
                              color: Colors.white, fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: DynamicSize.height(0.1, context),
                  // ),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Container(
                            margin: const EdgeInsetsDirectional.only(
                                start: 20, end: 20),
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              isExpanded: true,
                              icon: const Icon(Icons.arrow_drop_down),
                              iconSize: 24,
                              elevation: 16,
                              underline: SizedBox(
                                height: 0,
                                width: 0,
                              ),
                              style:
                                  TextStyleUtil.textStyleRaqiBookBold(context),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                              items: <String>[
                                'Pending',
                                'Completed',
                                'Done'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(height: 10),
                          ListView.builder(
                            itemCount: 3,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, i) {
                              return _bookingContainer(context);
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

  Container _bookingContainer(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(start: 20, end: 20, bottom: 10),
      padding: EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(
          color: Colors.grey.withOpacity(0.2), // red as border color
        ),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              height: 130,
              width: double.infinity,
              child: Image.network(
                'https://images.pexels.com/photos/323705/pexels-photo-323705.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Floor Cleaning',
                style: TextStyleUtil.textStyleRaqiBook(context),
                textAlign: TextAlign.center,
              ),
              Chip(
                padding: EdgeInsets.all(2),
                backgroundColor: AppColors.instance.themeColor,
                shadowColor: Colors.black,
                label: Text(
                  '#123',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ), //Text
              )
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '\$120',
              style: TextStyleUtil.textStyleRaqiBookBold(
                context,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(Icons.location_on),
              SizedBox(
                width: 10,
              ),
              Text(
                'House 203-A, Street 32, America',
                style: TextStyleUtil.textStyleRaqiBook(
                  context,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Icon(Icons.calendar_today_outlined),
              SizedBox(
                width: 10,
              ),
              Text(
                '15 Feb 2022 01 : 00 PM',
                style: TextStyleUtil.textStyleRaqiBook(
                  context,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Icon(Icons.person),
              SizedBox(
                width: 10,
              ),
              Text(
                'Johne dae',
                style: TextStyleUtil.textStyleRaqiBook(
                  context,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Divider(),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 45,
                  width: double.infinity,
                  child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.instance.themeColor,
                      child: Text(
                        'Accept',
                        style: TextStyleUtil.textStyleRaqiBook(context,
                            color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ServiceScreen()),
                        );
                      }),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Container(
                  height: 45,
                  width: double.infinity,
                  child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.withOpacity(0.1),
                      child: Text(
                        'Decline',
                        style: TextStyleUtil.textStyleRaqiBook(context,
                            color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HandymanListScreen()),
                        );
                      }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
