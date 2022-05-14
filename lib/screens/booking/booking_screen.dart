import 'package:caireapp/screens/dashboardScreen/dashboardScreen.dart';
import 'package:caireapp/util/text.dart';
import 'package:caireapp/viewmodel/login_viewmodel/login_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../constants/caireColors.dart';
import '../../device/device.dart';
import '../../viewmodel/booking/booking_screen_viewmodel.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  BookingViewModel bookingViewModel = BookingViewModel();
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
              body: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsetsDirectional.only(
                      start: 20, end: 20, bottom: 10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: DynamicSize.height(0.1, context),
                      ),
                      Container(
                        width: double.infinity,
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                  'https://images.pexels.com/photos/323705/pexels-photo-323705.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Floor Cleaning',
                                  style:
                                      TextStyleUtil.textStyleRaqiBook(context),
                                  textAlign: TextAlign.center,
                                ),
                                Chip(
                                  elevation: 20,
                                  padding: EdgeInsets.all(8),
                                  backgroundColor:
                                      AppColors.instance.themeColor,
                                  shadowColor: Colors.black,
                                  label: Text(
                                    '#123',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ), //Text
                                )
                              ],
                            ),
                            Text(
                              '\$120',
                              style: TextStyleUtil.textStyleRaqiBookBold(
                                context,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Row(
                              children: [
                                Icon(Icons.location_on),
                                Text(
                                  '15 Feb 2022 01 : 00 PM',
                                  style: TextStyleUtil.textStyleRaqiBook(
                                    context,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.calendar_today_outlined),
                                Text(
                                  '15 Feb 2022 01 : 00 PM',
                                  style: TextStyleUtil.textStyleRaqiBook(
                                    context,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.person),
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
                                    height: 50,
                                    width: double.infinity,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 35),
                                    child: CupertinoButton(
                                        borderRadius: BorderRadius.circular(12),
                                        color: AppColors.instance.themeColor,
                                        child: Text(
                                          'Login',
                                          style:
                                              TextStyleUtil.textStyleRaqiBook(
                                                  context),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeScreen()),
                                          );
                                        }),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 50,
                                    width: double.infinity,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 35),
                                    child: CupertinoButton(
                                        borderRadius: BorderRadius.circular(12),
                                        color: AppColors.instance.themeColor,
                                        child: Text(
                                          'Login',
                                          style:
                                              TextStyleUtil.textStyleRaqiBook(
                                                  context),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeScreen()),
                                          );
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
