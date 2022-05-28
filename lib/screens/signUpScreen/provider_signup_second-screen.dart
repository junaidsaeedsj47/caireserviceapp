import 'package:caireapp/screens/handyman/provider_dashboard.dart';
import 'package:caireapp/screens/loginScreen/login_screen.dart';
import 'package:caireapp/util/appUtil.dart';
import 'package:caireapp/util/text.dart';
import 'package:caireapp/viewmodel/signup_viewmodel/provider_signup_screen_viewmodel.dart';
import 'package:caireapp/widgets/caire_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import '../../constants/caireColors.dart';
import 'package:date_format/date_format.dart';

class ProviderSignUpSecondScreen extends StatefulWidget {
  const ProviderSignUpSecondScreen({Key? key}) : super(key: key);

  @override
  _ProviderSignUpSecondScreenState createState() =>
      _ProviderSignUpSecondScreenState();
}

class _ProviderSignUpSecondScreenState
    extends State<ProviderSignUpSecondScreen> {
  String dropDownValue = 'yes';
  String? _salutation = "Yes";
  final _salutations = [
    "Yes.",
    "No",
  ];
  double _currentSliderValue = 4;

  ProviderSignUpScreenViewModel providerSignUpScreenViewModel =
      ProviderSignUpScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ViewModelBuilder<ProviderSignUpScreenViewModel>.reactive(
          onModelReady: (model) {
            model.initialize(context);
          },
          viewModelBuilder: () => providerSignUpScreenViewModel,
          builder: (contextBuilder, model, child) {
            return Scaffold(
              backgroundColor: AppColors.instance.beforeLoginScreensBackground,
              body: SingleChildScrollView(
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
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Upload License',
                        style: TextStyleUtil.textStyleBeforeLoginRaqiBook(
                          context,
                        ),
                        // textAlign: TextAlign.l,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.infinity,
                        height: 150,
                        margin: const EdgeInsetsDirectional.only(
                            start: 30, end: 30, top: 0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border: Border.all(
                                color: AppColors.instance.appTextColor),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Choose Image',
                              style: TextStyleUtil.textStyleBeforeLoginRaqiBook(
                                context,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CarieTextFieldWithoutLabel(
                        focusedBorderColor:
                        AppColors.instance.appTextColor,
                        enableBorderColor:
                        AppColors.instance.appTextColor,
                        obscureText: false,
                        controller: model.consentController,
                        hintText: 'Consent',
                        hintStyle:
                        TextStyleUtil.textStyleBeforeLoginRaqiBook(
                            context,
                            fontSize: 14),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 14),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CarieTextFieldWithoutLabel(
                        focusedBorderColor: AppColors.instance.appTextColor,
                        enableBorderColor: AppColors.instance.appTextColor,
                        obscureText: false,
                        controller: model.experienceController,
                        hintText: 'Experience',
                        hintStyle: TextStyleUtil.textStyleBeforeLoginRaqiBook(
                            context,
                            fontSize: 14),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 14),
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Expanded(
                      //       child: CarieTextFieldWithoutLabel(
                      //         focusedBorderColor:
                      //             AppColors.instance.appTextColor,
                      //         enableBorderColor:
                      //             AppColors.instance.appTextColor,
                      //         obscureText: false,
                      //         controller: model.consentController,
                      //         hintText: 'Consent',
                      //         hintStyle:
                      //             TextStyleUtil.textStyleBeforeLoginRaqiBook(
                      //                 context,
                      //                 fontSize: 14),
                      //         contentPadding: const EdgeInsets.symmetric(
                      //             vertical: 14, horizontal: 14),
                      //       ),
                      //     ),
                      //     const SizedBox(
                      //       width: 15,
                      //     ),
                      //     Expanded(
                      //       child: Container(
                      //         width: MediaQuery.of(context).size.width / 2.5,
                      //         // margin: const EdgeInsetsDirectional.only(
                      //         //     start: 20, end: 20),
                      //         padding: EdgeInsetsDirectional.only(
                      //             top: 8, start: 20, bottom: 8, end: 20),
                      //         decoration: BoxDecoration(
                      //           color: AppColors.instance.white,
                      //           borderRadius:
                      //               BorderRadius.all(Radius.circular(5)),
                      //           border: Border.all(
                      //               color: AppColors.instance.appTextColor),
                      //         ),
                      //         child: DropdownButton<dynamic>(
                      //           hint: Text(
                      //             'Select Service',
                      //             style: TextStyleUtil
                      //                 .textStyleBeforeLoginRaqiBook(context,
                      //                     fontSize: 14,
                      //                     color:
                      //                         AppColors.instance.appTextColor),
                      //           ),
                      //           value: model.serviceDropdownValue!.isNotEmpty
                      //               ? model.serviceDropdownValue
                      //               : null,
                      //           isDense: true,
                      //           isExpanded: true,
                      //           icon: Icon(
                      //             Icons.arrow_drop_down,
                      //             color: AppColors.instance.appTextColor,
                      //           ),
                      //           iconSize: 24,
                      //           underline: SizedBox(
                      //             height: 0,
                      //             width: 0,
                      //           ),
                      //           style:
                      //               TextStyleUtil.textStyleBeforeLoginRaqiBook(
                      //             context,
                      //             fontSize: 14,
                      //           ),
                      //           onChanged: (dynamic dropDownValue) {
                      //             model.updateSelectedValue(dropDownValue);
                      //           },
                      //           items: model.listOfServices
                      //               .map<DropdownMenuItem>((dynamic value) {
                      //             return DropdownMenuItem(
                      //               value: value,
                      //               child: Text(
                      //                 value ?? "",
                      //                 style: TextStyleUtil
                      //                     .textStyleBeforeLoginRaqiBook(context,
                      //                         fontSize: 14,
                      //                         color: AppColors
                      //                             .instance.appTextColor),
                      //                 textAlign: TextAlign.start,
                      //               ),
                      //             );
                      //           }).toList(),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // Container(
                      //   margin: const EdgeInsets.symmetric(horizontal: 30),
                      //   height: 54,
                      //   width: double.infinity,
                      //   child: CupertinoButton(
                      //     borderRadius: BorderRadius.circular(12),
                      //     color: Colors.green,
                      //     child: Text(
                      //       'Upload Picture',
                      //       style: TextStyleUtil.textStyleRaqiBook(context,
                      //       color: Colors.white),
                      //     ),
                      //     onPressed: () {
                      //       // Navigator.push(
                      //       //   context,
                      //       //   MaterialPageRoute(builder: (context) => HomeScreen()),
                      //       // );
                      //     },
                      //   ),
                      // ),

                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2.5,
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
                                  'Select Service',
                                  style: TextStyleUtil
                                      .textStyleBeforeLoginRaqiBook(context,
                                      fontSize: 14,
                                      color:
                                      AppColors.instance.appTextColor),
                                ),
                                value: model.serviceDropdownValue!.isNotEmpty
                                    ? model.serviceDropdownValue
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
                                style:
                                TextStyleUtil.textStyleBeforeLoginRaqiBook(
                                  context,
                                  fontSize: 14,
                                ),
                                onChanged: (dynamic dropDownValue) {
                                  model.updateSelectedValue(dropDownValue);
                                },
                                items: model.listOfServices
                                    .map<DropdownMenuItem>((dynamic value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(
                                      value ?? "",
                                      style: TextStyleUtil
                                          .textStyleBeforeLoginRaqiBook(context,
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
                          // Text(
                          //   'Offer Services At : ',
                          //   style: TextStyleUtil.textStyleBeforeLoginRaqiBook(
                          //       context,
                          //       fontSize: 14),
                          // ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            // margin: const EdgeInsetsDirectional.only(
                            //     start: 20, end: 20),
                            padding: EdgeInsetsDirectional.only(
                                top: 8, start: 20, bottom: 8, end: 20),
                            decoration: BoxDecoration(
                              color: AppColors.instance.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                                border: Border.all(
                                    color: AppColors.instance.appTextColor)
                            ),
                            child: DropdownButton<dynamic>(
                              hint: Text(
                                'Select Place',
                                style:
                                    TextStyleUtil.textStyleBeforeLoginRaqiBook(
                                        context,
                                        fontSize: 14,
                                        color: AppColors.instance.appTextColor),
                              ),
                              value: model.offerPlaceDropdownValue!.isNotEmpty
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
                              style: TextStyleUtil.textStyleBeforeLoginRaqiBook(
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
                                        .textStyleBeforeLoginRaqiBook(context,
                                            fontSize: 14,
                                            color: AppColors.instance.appTextColor),
                                    textAlign: TextAlign.start,
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Pick radius',
                        style:
                        TextStyleUtil.textStyleBeforeLoginRaqiBook(context),
                      ),

                      Slider(
                        value: _currentSliderValue,
                        min: 0,
                        max: 100,
                        divisions: 5,
                        inactiveColor: AppColors.instance.lightGreyText,
                        thumbColor: AppColors.instance.themeColor,
                        activeColor: AppColors.instance.themeColor,
                        label: _currentSliderValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue = value;
                          });
                        },
                      ),
                      // CarieTextFieldWithoutLabel(
                      //   focusedBorderColor: AppColors.instance.appTextColor,
                      //   enableBorderColor: AppColors.instance.appTextColor,
                      //   obscureText: false,
                      //   controller: model.experienceController,
                      //   hintText: 'Experience',
                      //   hintStyle: TextStyleUtil.textStyleBeforeLoginRaqiBook(
                      //       context,
                      //       fontSize: 14),
                      //   contentPadding: const EdgeInsets.symmetric(
                      //       vertical: 14, horizontal: 14),
                      // ),
                      // const SizedBox(
                      //   height: 15,
                      // ),
                      // CarieTextFieldWithoutLabel(
                      //   obscureText: true,
                      //   controller: model.availabilityController,
                      //   hintText: 'Availability',
                      //   hintStyle: TextStyleUtil.textStyleBeforeLoginRaqiBook(
                      //       context,
                      //       fontSize: 14),
                      //   contentPadding: const EdgeInsets.symmetric(
                      //       vertical: 14, horizontal: 14),
                      // ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('No of Days : ',
                                    style: TextStyleUtil
                                        .textStyleBeforeLoginRaqiBook(context,
                                            fontSize: 14)),
                                SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  child: Expanded(
                                    child: CarieTextFieldWithoutLabel(
                                      focusedBorderColor:
                                          AppColors.instance.appTextColor,
                                      enableBorderColor:
                                          AppColors.instance.appTextColor,
                                      keyboardType: TextInputType.number,
                                      obscureText: false,
                                      controller: model.availabilityController,
                                      hintText: 'Enter',
                                      hintStyle: TextStyleUtil
                                          .textStyleBeforeLoginRaqiBook(context,
                                              fontSize: 14),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 14, horizontal: 14),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('Select Time :',
                                    style: TextStyleUtil
                                        .textStyleBeforeLoginRaqiBook(context,
                                            fontSize: 14)),
                                GestureDetector(
                                    onTap: () {
                                      DatePicker.showTimePicker(
                                        context,
                                        showTitleActions: true,
                                        onChanged: (date) {

                                          print('change $date in time zone ' +
                                              date.timeZoneOffset.inHours
                                                  .toString());
                                        },
                                        onConfirm: (date) {
                                          model.updateSelectedTime(date);
                                          print('confirm $date');
                                        },
                                        currentTime: DateTime.now(),
                                      );
                                    },
                                    child: Text(
                                      AppUtils.showFormattedTime(model.selectedDate),
                                      style: TextStyleUtil
                                          .textStyleBeforeLoginRaqiBook(context,
                                              fontSize: 14),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Possession of Tools : ' + model.toolsValue!,
                            style: TextStyleUtil.textStyleBeforeLoginRaqiBook(
                                context,
                                fontSize: 14),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Transform.scale(
                            scale: 1.3,
                            child: Switch(
                                splashRadius: 3,
                                // materialTapTargetSize:
                                //     MaterialTapTargetSize.padded,
                                inactiveThumbColor: AppColors.instance.white,
                                inactiveTrackColor:
                                    AppColors.instance.lightGreyText,
                                activeColor: AppColors.instance.themeColor,
                                activeTrackColor:
                                    AppColors.instance.lightGreyText,
                                value: model.isToolsAvailable,
                                onChanged: (value) {
                                  model.updateTheToolsStatus(value);
                                }),
                          ),
                        ],
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
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => HomeScreen()),
                            // );
                            AppUtils.pushRoute(
                                context: context,
                                route: ProviderDashboardScreen());
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
                              style: TextStyleUtil.textStyleBeforeLoginRaqiBook(
                                  context),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
