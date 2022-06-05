import 'package:caireapp/screens/bookingProgressDetails/check_user_booking_status.dart';
import 'package:caireapp/screens/consumerDetails/consumer_details_screen.dart';
import 'package:caireapp/screens/dashboardScreen/dashboardScreen.dart';
import 'package:caireapp/util/appUtil.dart';
import 'package:caireapp/util/enum.dart';
import 'package:caireapp/util/text.dart';
import 'package:caireapp/viewmodel/bookingProgressDetails/check_status_viewmodel.dart';
import 'package:caireapp/viewmodel/providerSideBooking/provider_side_booking_main_viewmodel.dart';
import 'package:caireapp/widgets/custom_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../constants/caireColors.dart';
import '../provider_side_service_completed.dart';
import '../service/service_screen.dart';

class ProviderSideBookingScreen extends StatefulWidget {
  const ProviderSideBookingScreen({Key? key}) : super(key: key);

  @override
  _ProviderSideBookingScreenState createState() => _ProviderSideBookingScreenState();
}

class _ProviderSideBookingScreenState extends State<ProviderSideBookingScreen> {
  ProviderSideBookingViewModel providerSideBookingViewModel = ProviderSideBookingViewModel();

  // String dropdownValue = 'In Progress';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ViewModelBuilder<ProviderSideBookingViewModel>.reactive(
          onModelReady: (model) {
            model.initialize(context);
          },
          viewModelBuilder: () => providerSideBookingViewModel,
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
                              value: model.selectedValue,
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
                                model.updateBookingTypes(newValue!);
                              },
                              items: model.listOfBookingServices.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text( value),
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

  Container _bookingContainer(BuildContext context,ProviderSideBookingViewModel model) {
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.start,
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
             ],),
                CupertinoButton(
                  // color: AppColors.instance.themeColor,
                  onPressed: () {
                    AppUtils.pushRoute(
                        context: context,
                        route: ConsumerDetailsScreen(
                        ));
                  },
                  padding: EdgeInsetsDirectional.only(
                    top: 10,
                    bottom: 10,
                  ),
                  child: Text(
                    "View Profile",
                    style: TextStyleUtil.textStyleRaqiBook(context,
                        color: AppColors.instance.themeColor,
                        fontSize: 20),
                  ),
                ),

            ],
          ),
          if(model.bookingTypes==BookingTypes.New)
            Divider(),
          if(model.bookingTypes==BookingTypes.New)
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
                                builder: (context) =>  CheckUserBookingStatus(providerSideScreen: true,)),
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
                          declineNewBookingDialog(context);
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const HandymanListScreen()),
                          // );
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
                          'Complete Service',
                          style: TextStyleUtil.textStyleRaqiBook(context,
                              color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProviderSideServiceCompleted(providerCompletingService: true,)),
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
 declineNewBookingDialog(BuildContext context){
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