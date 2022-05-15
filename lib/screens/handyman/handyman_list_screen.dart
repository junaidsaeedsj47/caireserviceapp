import 'package:caireapp/screens/dashboardScreen/dashboardScreen.dart';
import 'package:caireapp/util/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../constants/caireColors.dart';
import '../../viewmodel/booking/booking_screen_viewmodel.dart';
import '../../viewmodel/handyman/handyman_list_viewmodel.dart';
import '../service/add_service_screen.dart';
import '../service/service_screen.dart';

class HandymanListScreen extends StatefulWidget {
  const HandymanListScreen({Key? key}) : super(key: key);

  @override
  _HandymanListScreenState createState() => _HandymanListScreenState();
}

class _HandymanListScreenState extends State<HandymanListScreen> {
  HandymanListViewModel handymanListViewModel = HandymanListViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ViewModelBuilder<HandymanListViewModel>.reactive(
          onModelReady: (model) {
            model.initialize(context);
          },
          viewModelBuilder: () => handymanListViewModel,
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
                      padding:
                          const EdgeInsetsDirectional.only(start: 20, end: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                            Text(
                              'Handyman List',
                              style: TextStyleUtil.textStyleRaqiBookBold(
                                  context,
                                  color: Colors.white,
                                  fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                            Spacer(),
                            Icon(
                              Icons.add,
                              color: Colors.white,
                            )
                          ],
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
          color: Colors.grey.withOpacity(0.1)),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 36,
                backgroundImage: NetworkImage(
                    'https://preview.keenthemes.com/metronic-v4/theme/assets/pages/media/profile/profile_user.jpg'),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John',
                      style: TextStyleUtil.textStyleRaqiBookBold(context),
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      children: [
                        Icon(Icons.mail_outline),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'josh@gmail.com',
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
                        Icon(Icons.location_on),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            'location dob america',
                            style: TextStyleUtil.textStyleRaqiBook(
                              context,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(Icons.phone),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '(704) 555-0322',
                          style: TextStyleUtil.textStyleRaqiBook(
                            context,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
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
                        'Activate',
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
                        'Deactivate',
                        style: TextStyleUtil.textStyleRaqiBook(context,
                            color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AddServiceScreen()),
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
