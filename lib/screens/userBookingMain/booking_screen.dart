import 'package:caireapp/screens/bookingProgressDetails/booking_progress_details_screen.dart';
import 'package:caireapp/screens/dashboardScreen/dashboardScreen.dart';
import 'package:caireapp/screens/paymentDetails/payment_details_screen.dart';
import 'package:caireapp/util/appUtil.dart';
import 'package:caireapp/util/enum.dart';
import 'package:caireapp/util/text.dart';
import 'package:caireapp/viewmodel/userBookingMain/booking_screen_viewmodel.dart';
import 'package:caireapp/widgets/custom_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:universal_platform/universal_platform.dart';

import '../../constants/caireColors.dart';
import '../handyman/handyman_list_screen.dart';
import '../service/service_screen.dart';

class BookingMainScreen extends StatefulWidget {
  const BookingMainScreen({Key? key}) : super(key: key);

  @override
  _BookingMainScreenState createState() => _BookingMainScreenState();
}

class _BookingMainScreenState extends State<BookingMainScreen> {
  BookingMainViewModel bookingViewModel = BookingMainViewModel();

  // String dropdownValue = 'In Progress';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ViewModelBuilder<BookingMainViewModel>.reactive(
          onModelReady: (model) {
            model.initialize(context);
          },
          viewModelBuilder: () => bookingViewModel,
          builder: (contextBuilder, model, child) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppUtils.showAppBar(
                  context: context, title: "Booking", showBack: false),
              // bottomNavigationBar: AppUtils.appBottomBar(context),
              body: Column(
                children: [
                  // SizedBox(
                  //   height: DynamicSize.height(0.1, context),
                  // ),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          tabBarItems(context, model),
                          SizedBox(height: 20),
                          // Container(
                          //   margin: const EdgeInsetsDirectional.only(
                          //       start: 20, end: 20),
                          //   padding: EdgeInsets.symmetric(horizontal: 12),
                          //   decoration: BoxDecoration(
                          //     color: Colors.grey.withOpacity(0.1),
                          //     borderRadius:
                          //         BorderRadius.all(Radius.circular(5)),
                          //   ),
                          //   child: DropdownButton<String>(
                          //     value: model.selectedValue,
                          //     isExpanded: true,
                          //     icon: const Icon(Icons.arrow_drop_down),
                          //     iconSize: 24,
                          //     elevation: 16,
                          //     underline: SizedBox(
                          //       height: 0,
                          //       width: 0,
                          //     ),
                          //     style:
                          //         TextStyleUtil.textStyleRaqiBookBold(context),
                          //     onChanged: (String? newValue) {
                          //       model.updateBookingTypes(newValue!);
                          //     },
                          //     items: model.listOfBookingServices.map<DropdownMenuItem<String>>((String value) {
                          //       return DropdownMenuItem<String>(
                          //         value: value,
                          //         child: Text( value),
                          //       );
                          //     }).toList(),
                          //   ),
                          // ),
                          // SizedBox(height: 10),
                          model.showLoader
                              ? CircularProgressIndicator(
                              color: AppColors.instance.themeColor)
                              :  ListView.builder(
                            itemCount: 3,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, i) {
                              return _bookingContainer(context,model);
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
  Widget tabBarItems(BuildContext context, BookingMainViewModel model) {
    return Container(
      margin: const EdgeInsetsDirectional.only(start: 10, end: 10, top: 20),
      height: 40,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: model.userTabBarItems.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                model.selectedTabView(model.userTabBarItems[index].tabIndex);
              },
              child: Container(
                // padding: EdgeInsetsDirectional.only(start: 10,end: 10),
                // height: 30,
                margin: const EdgeInsetsDirectional.only(end: 15),
                width:UniversalPlatform.isWeb ?200 :MediaQuery.of(context).size.width / 2.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: index == model.currentIndex
                      ? AppColors.instance.themeColor
                      : AppColors.instance.backGroundColor,
                ),
                child: Center(
                  child: Text(
                    model.userTabBarItems[index].tabTitle ?? "",
                    style: TextStyleUtil.textStyleRaqiBook(context,
                        color: index == model.currentIndex
                            ? AppColors.instance.white
                            : AppColors.instance.black),
                  ),
                ),
                // child: CupertinoButton(
                //   pressedOpacity: 0.0,
                //     padding: EdgeInsetsDirectional.zero,
                //     borderRadius: BorderRadius.circular(8),
                //     color: index==model.currentIndex
                //         ? AppColors.instance.themeColor
                //         : AppColors.instance.lightGreyText,
                //     child: Text(
                //       model.tabBarItems[index].tabTitle ?? "",
                //       style: TextStyleUtil.textStyleRaqiBook(context,
                //           color: Colors.white),
                //     ),
                //     onPressed: () {
                //       // Navigator.push(
                //       //   context,
                //       //   MaterialPageRoute(
                //       //       builder: (context) => CheckUserBookingStatus(
                //       //             providerSideScreen: true,
                //       //           )),
                //       // );
                //       model.selectedTabView(model.tabBarItems[index].tabIndex);
                //     }),
              ),
            );
          }),
    );
  }
  Container _bookingContainer(BuildContext context,BookingMainViewModel model) {
    return Container(
      margin: const EdgeInsetsDirectional.only(start: 10, end: 10, bottom: 10),
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
          if(model.bookingTypes==BookingTypes.WaitingProvider)
          Divider(),
          if(model.bookingTypes==BookingTypes.WaitingProvider)
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
                        'Check Status',
                        style: TextStyleUtil.textStyleRaqiBook(context,
                            color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  BookingProgressDetailsScreen(
                                servicesData: model.servicesData.first,
                                selectedDate: DateTime.now(),
                                selectedTime: DateTime.now(),
                              )),
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
                        'Cancel Booking',
                        style: TextStyleUtil.textStyleRaqiBook(context,
                            color: Colors.black),
                      ),
                      onPressed: () {
                        cancelBookingShowDialog(context);
                      }),
                ),
              ),
            ],
          ),
          if(model.bookingTypes==BookingTypes.InProgress)
            Divider(),
          if(model.bookingTypes==BookingTypes.InProgress)
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
                          'Complete Booking',
                          style: TextStyleUtil.textStyleRaqiBook(context,
                              color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PaymentDetailsScreen()),
                          );
                        }),
                  ),
                ),
              ],
            ),
          if (model.bookingTypes == BookingTypes.Scheduled) Divider(),
          if (model.bookingTypes == BookingTypes.Scheduled)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Scheduled On :",
                  style: TextStyleUtil.textStyleRaqiBook(
                    context,
                  ),
                ),
                Text(
                  "15 June 2022 12 : 00 PM",
                  style: TextStyleUtil.textStyleRaqiBook(context,
                      color: AppColors.instance.themeColor),
                ),
              ],
            ),
          if (model.bookingTypes == BookingTypes.Scheduled)
            SizedBox(
              height: 5,
            ),
          if (model.bookingTypes == BookingTypes.Scheduled)
            Container(
              height: 45,
              width: double.infinity,
              child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.instance.lightGreyText.withOpacity(0.1),
                  child: Text(
                    'Cancel',
                    style: TextStyleUtil.textStyleRaqiBook(context,
                        color: Colors.black),
                  ),
                  onPressed: () {
                    cancelBookingShowDialog(context);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const HandymanListScreen()),
                    // );
                  }),
            ),
          if(model.bookingTypes==BookingTypes.Cancelled)
            Divider(),
          if(model.bookingTypes==BookingTypes.Cancelled)
          Container(
            // height: 45,
            width: double.infinity,
            child: Center(
              child: Text(
                'Cancelled',
                style: TextStyleUtil.textStyleRaqiBook(context,
                    color: Colors.black),
              ),
            ),
          ),
          if(model.bookingTypes==BookingTypes.Completed)
            Divider(),
          if(model.bookingTypes==BookingTypes.Completed)
            Container(
              // height: 45,
              width: double.infinity,
              child: Center(
                child: Text(
                  'Completed',
                  style: TextStyleUtil.textStyleRaqiBook(context,
                      color: Colors.black),
                ),
              ),
            ),
        ],
      ),
    );
  }
  cancelBookingShowDialog(BuildContext context){
    return    showDialog(
        context: context,
        builder: (contextBuilder) => ShowPopup(
          title: "Warning!",
          description: "Do you want to cancel the booking?",
          actions: [
            AppAlertAction(
              title: "Yes",
              handler: (_) {
                AppUtils.pop(context: context);
              },
              showWhiteButton: false,
            ),
            AppAlertAction(
              title: "Cancel",
              showWhiteButton: true,
            ),
          ],
          // image: Image.asset(MobilyConstants.baseImagePath + "common/info.png"),
        ),
        barrierDismissible: true);
  }
}
