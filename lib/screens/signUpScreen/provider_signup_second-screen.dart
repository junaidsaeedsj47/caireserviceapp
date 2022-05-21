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
              backgroundColor: AppColors.instance.themeColor,
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
                            border: Border.all(),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Choose Image',
                              style: TextStyleUtil.textStyleBeforeLoginRaqiBook(
                                  context,
                                  color: AppColors.instance.black),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: CarieTextFieldWithoutLabel(
                              enableBorderColor: AppColors.instance.black,
                              obscureText: true,
                              controller: model.consentController,
                              hintText: 'Consent',
                              hintStyle:
                                  TextStyleUtil.textStyleBeforeLoginRaqiBook(
                                      context,
                                      fontSize: 14),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 14, horizontal: 14),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
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
                              ),
                              child: DropdownButton<dynamic>(
                                hint: Text(
                                  'Select Service',
                                  style: TextStyleUtil
                                      .textStyleBeforeLoginRaqiBook(context,
                                          fontSize: 14,
                                          color: AppColors.instance.black),
                                ),
                                value: model.serviceDropdownValue!.isNotEmpty
                                    ? model.serviceDropdownValue
                                    : null,
                                isDense: true,
                                isExpanded: true,
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: AppColors.instance.black,
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
                                              color: AppColors.instance.black),
                                      textAlign: TextAlign.start,
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
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
                        thumbColor: AppColors.instance.black,
                        activeColor: AppColors.instance.white,
                        label: _currentSliderValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Offer Services At : ',
                            style: TextStyleUtil.textStyleBeforeLoginRaqiBook(
                                context,
                                fontSize: 14),
                          ),
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
                            ),
                            child: DropdownButton<dynamic>(
                              hint: Text(
                                'Select Place',
                                style:
                                    TextStyleUtil.textStyleBeforeLoginRaqiBook(
                                        context,
                                        fontSize: 14,
                                        color: AppColors.instance.black),
                              ),
                              value: model.offerPlaceDropdownValue!.isNotEmpty
                                  ? model.offerPlaceDropdownValue
                                  : null,
                              isDense: true,
                              isExpanded: true,
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: AppColors.instance.black,
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
                                            color: AppColors.instance.black),
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
                      CarieTextFieldWithoutLabel(
                        enableBorderColor: AppColors.instance.black,
                        obscureText: true,
                        controller: model.experienceController,
                        hintText: 'Experience',
                        hintStyle: TextStyleUtil.textStyleBeforeLoginRaqiBook(
                            context,
                            fontSize: 14),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 14),
                      ),
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
                                      enableBorderColor: AppColors.instance.black,
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
                                Text('Time :',
                                    style: TextStyleUtil
                                        .textStyleBeforeLoginRaqiBook(context,
                                            fontSize: 14)),
                                TextButton(
                                    onPressed: () {
                                      DatePicker.showTimePicker(
                                        context,
                                        showTitleActions: true,
                                        onChanged: (date) {
                                          model.selectedDate = date;
                                          print('change $date in time zone ' +
                                              date.timeZoneOffset.inHours
                                                  .toString());
                                        },
                                        onConfirm: (date) {
                                          print('confirm $date');
                                        },
                                        currentTime: DateTime.now(),
                                      );
                                    },
                                    child: Text(
                                      model.selectedDate.hour.toString() +
                                          ":" +
                                          model.selectedDate.minute.toString(),
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
                                activeColor: AppColors.instance.black,
                                activeTrackColor: AppColors.instance.white,
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
                          color: AppColors.instance.white,
                          child: Text(
                            'Sign up',
                            style: TextStyleUtil.textStyleBeforeLoginRaqiBook(
                                context,
                                color: AppColors.instance.black),
                          ),
                          onPressed: () {
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
                              AppUtils.navigationRoute(
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