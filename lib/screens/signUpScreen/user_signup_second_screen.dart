import 'package:auto_size_text/auto_size_text.dart';
import 'package:caireapp/screens/chat/chat_screen.dart';
import 'package:caireapp/screens/handyman/provider_dashboard.dart';
import 'package:caireapp/screens/loginScreen/login_screen.dart';
import 'package:caireapp/screens/profile/profile_screen.dart';
import 'package:caireapp/screens/providerSideBooking/provider_side_booking_main_screen.dart';
import 'package:caireapp/screens/userProfileOption/user_profile_all_options_screen.dart';
import 'package:caireapp/util/appUtil.dart';
import 'package:caireapp/util/text.dart';
import 'package:caireapp/viewmodel/signup_viewmodel/signup-second_viewmodel.dart';
import 'package:caireapp/widgets/bottom_navigation_bar.dart';
import 'package:caireapp/widgets/caire_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:universal_platform/universal_platform.dart';
import '../../constants/caireColors.dart';

class UserSignUpSecondScreen extends StatefulWidget {
  const UserSignUpSecondScreen({Key? key}) : super(key: key);

  @override
  _UserSignUpSecondScreenState createState() => _UserSignUpSecondScreenState();
}

class _UserSignUpSecondScreenState extends State<UserSignUpSecondScreen> {
  double _currentSliderValue = 4;

  UserSignUpScreenViewModel userSignUpScreenViewModel =
      UserSignUpScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ViewModelBuilder<UserSignUpScreenViewModel>.reactive(
          onModelReady: (model) {
            model.initialize(context);
          },
          viewModelBuilder: () => userSignUpScreenViewModel,
          builder: (contextBuilder, model, child) {
            return Scaffold(
              backgroundColor: AppColors.instance.beforeLoginScreensBackground,
              body: Center(
                child: SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsetsDirectional.only(
                        start: 20, end: 20, bottom: 20, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Align(
                        //   alignment: Alignment.center,
                        //   child: Text(
                        //     'Caire',
                        //     style: TextStyleUtil.textStyleRaqiBook(context,
                        //         fontSize: 24),
                        //     textAlign: TextAlign.center,
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 19,
                        // ),
                        Align(
                          alignment: Alignment.center,
                          child: Text('Complete your Profile',
                              style: TextStyleUtil.textStyleBeforeLoginRaqiBook(
                                  context),
                              textAlign: TextAlign.center),
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: CarieTextFieldWithoutLabel(
                                obscureText: false,
                                controller: model.cardNumberController,
                                hintText: 'Tools and Equipment Checklist',
                                enableBorderColor:
                                    AppColors.instance.appTextColor,
                                hintStyle:
                                    TextStyleUtil.textStyleBeforeLoginRaqiBook(
                                        context,
                                        fontSize: 14),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 14, horizontal: 14),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Services Rendered At : ',
                              style: TextStyleUtil.textStyleBeforeLoginRaqiBook(
                                  context,
                                  fontSize: 14),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width / 2,
                                // margin: const EdgeInsetsDirectional.only(
                                //     start: 20, end: 20),
                                padding: EdgeInsetsDirectional.only(
                                    top: 8, start: 20, bottom: 8, end: 20),
                                decoration: BoxDecoration(
                                  color: AppColors.instance.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  border: Border.all(
                                      color: AppColors.instance.appTextColor),
                                ),
                                child: DropdownButton<dynamic>(
                                  hint: Text(
                                    'Select Place',
                                    style: TextStyleUtil
                                        .textStyleBeforeLoginRaqiBook(context,
                                            fontSize: 14,
                                            color: AppColors
                                                .instance.appTextColor),
                                  ),
                                  value:
                                      model.offerPlaceDropdownValue!.isNotEmpty
                                          ? model.offerPlaceDropdownValue
                                          : null,
                                  isDense: true,
                                  isExpanded: true,
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: AppColors.instance.appTextColor,
                                  ),
                                  iconSize: 24,
                                  underline: SizedBox(
                                    height: 0,
                                    width: 0,
                                  ),
                                  style: TextStyleUtil
                                      .textStyleBeforeLoginRaqiBook(
                                    context,
                                    fontSize: 14,
                                  ),
                                  onChanged: (dynamic dropDownValue) {
                                    model.selectedPlaceOfService(dropDownValue);
                                  },
                                  items: model.serviceOfferPlace
                                      .map<DropdownMenuItem>((dynamic value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(
                                        value ?? "",
                                        style: TextStyleUtil
                                            .textStyleBeforeLoginRaqiBook(
                                                context,
                                                fontSize: 14,
                                                color: AppColors
                                                    .instance.appTextColor),
                                        textAlign: TextAlign.start,
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        Container(
                          padding: AppUtils.unifiedPaddingOfScreen(
                              start: 20, end: 20, top: 30, bottom: 30),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.instance.backGroundColor),
                          child: Column(
                            children: [
                              Text(
                                'Credit Card Information',
                                style:
                                    TextStyleUtil.textStyleBeforeLoginRaqiBook(
                                  context,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CarieTextFieldWithoutLabel(
                                obscureText: false,
                                controller: model.cardNumberController,
                                hintText: 'Enter Card Number',
                                enableBorderColor:
                                    AppColors.instance.appTextColor,
                                hintStyle:
                                    TextStyleUtil.textStyleBeforeLoginRaqiBook(
                                        context,
                                        fontSize: 14),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 14, horizontal: 14),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('CVC : ',
                                            style: TextStyleUtil
                                                .textStyleBeforeLoginRaqiBook(
                                                    context,
                                                    fontSize: 14)),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Expanded(
                                          child: CarieTextFieldWithoutLabel(
                                            obscureText: false,
                                            controller: model.cvcController,
                                            hintText: 'Enter',
                                            enableBorderColor:
                                                AppColors.instance.appTextColor,
                                            hintStyle: TextStyleUtil
                                                .textStyleBeforeLoginRaqiBook(
                                              context,
                                              fontSize: 14,
                                            ),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 14,
                                                    horizontal: 14),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text('Expiry : ',
                                      style: TextStyleUtil
                                          .textStyleBeforeLoginRaqiBook(
                                        context,
                                        fontSize: 14,
                                      )),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: AppColors
                                                .instance.appTextColor)),
                                    child: TextButton(
                                      onPressed: () {
                                        DatePicker.showDatePicker(
                                          context,
                                          showTitleActions: true,
                                          onChanged: (date) {
                                            // model.selectedDate = date;
                                            print('change $date in time zone ' +
                                                date.timeZoneOffset.inHours
                                                    .toString());
                                          },
                                          onConfirm: (date) {
                                            print('confirm $date');
                                            model.updateExpiryDate(date);
                                          },
                                          currentTime: DateTime.now(),
                                        );
                                      },
                                      child: AutoSizeText(
                                          AppUtils.showFormattedDate(
                                              model.selectedDate),
                                          style: TextStyleUtil
                                              .textStyleBeforeLoginRaqiBook(
                                            context,
                                            fontSize: 14,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          height: 54,
                          width: double.infinity,
                          child: CupertinoButton(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.instance.themeColor,
                            child: Text(
                              'Sign up',
                              style: TextStyleUtil.textStyleBeforeLoginRaqiBook(
                                  context,
                                  color: AppColors.instance.white),
                            ),
                            onPressed: () {
                              if (UniversalPlatform.isWeb) {
                                AppUtils.pushRoute(
                                    context: context,
                                    route: ProviderDashboardScreen());
                              } else {
                                AppUtils.pushRoute(
                                    context: context,
                                    route: AppBottomBar(bottomBarPages: [
                                      ProviderDashboardScreen(),
                                      ChatScreen(),
                                      ProviderSideBookingScreen(),
                                      NavDrawer(),
                                    ]));
                              }
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => HomeScreen()),
                              // );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        // RichText(
                        //   text: TextSpan(
                        //     text: 'Have an account ? ',
                        //     style: TextStyleUtil.textStyleRaqiBook(context),
                        //     children: <TextSpan>[
                        //       TextSpan(
                        //         text: 'Log in ',
                        //         style: TextStyleUtil.textStyleRaqiBook(context),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        Row(
                          children: [
                            Text(
                              'Have an account ? ',
                              style: TextStyleUtil.textStyleBeforeLoginRaqiBook(
                                  context),
                            ),
                            GestureDetector(
                              onTap: () {
                                AppUtils.pushRoute(
                                    context: context, route: LoginScreen());
                              },
                              child: Text(
                                'Log in ',
                                style:
                                    TextStyleUtil.textStyleBeforeLoginRaqiBook(
                                        context),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
