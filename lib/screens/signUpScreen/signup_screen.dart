import 'package:caireapp/screens/loginScreen/login_screen.dart';
import 'package:caireapp/screens/signUpScreen/provider_signup_second-screen.dart';
import 'package:caireapp/screens/signUpScreen/user_signup_second_screen.dart';
import 'package:caireapp/util/appUtil.dart';
import 'package:caireapp/util/enum.dart';
import 'package:caireapp/util/text.dart';
import 'package:caireapp/viewmodel/signup_viewmodel/signup_viewmodel.dart';
import 'package:caireapp/widgets/caire_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../constants/caireColors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String dropDownValue = 'yes';
  String? _salutation = "Yes";
  final _salutations = [
    "Yes.",
    "No",
  ];
  double _currentSliderValue = 4;

  SignUpScreenViewModel signUpScreenViewModel = SignUpScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ViewModelBuilder<SignUpScreenViewModel>.reactive(
          onModelReady: (model) {
            model.initialize(context);
          },
          viewModelBuilder: () => signUpScreenViewModel,
          builder: (contextBuilder, model, child) {
            return Scaffold(
              backgroundColor: AppColors.instance.themeColor,
              body: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsetsDirectional.only(
                      start: 20, end: 20, bottom: 30, top: 40),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Caire',
                          style: TextStyleUtil.textStyleBeforeLoginRaqiBook(
                              context,
                              fontSize: 24),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 19,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text('Enter Details For Sign-Up',
                            style: TextStyleUtil.textStyleBeforeLoginRaqiBook(
                                context),
                            textAlign: TextAlign.center),
                      ),
                      const SizedBox(
                        height: 19,
                      ),
                      CarieTextFieldWithoutLabel(
                        enableBorderColor: AppColors.instance.black,
                        controller: model.nameController,
                        hintText: 'Name',
                        hintStyle: TextStyleUtil.textStyleBeforeLoginRaqiBook(
                            context,
                            fontSize: 14),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 20),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CarieTextFieldWithoutLabel(
                        enableBorderColor: AppColors.instance.black,
                        controller: model.emailController,
                        hintText: 'Email',
                        hintStyle: TextStyleUtil.textStyleBeforeLoginRaqiBook(
                            context,
                            fontSize: 14),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 20),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CarieTextFieldWithoutLabel(
                        enableBorderColor: AppColors.instance.black,
                        controller: model.phoneController,
                        hintText: 'Phone',
                        hintStyle: TextStyleUtil.textStyleBeforeLoginRaqiBook(
                            context,
                            fontSize: 14),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 20),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CarieTextFieldWithoutLabel(
                        enableBorderColor: AppColors.instance.black,
                        controller: model.addressController,
                        hintText: 'Address',
                        hintStyle: TextStyleUtil.textStyleBeforeLoginRaqiBook(
                            context,
                            fontSize: 14),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 20),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CarieTextFieldWithoutLabel(
                              enableBorderColor: AppColors.instance.black,
                              obscureText: true,
                              controller: model.passwordController,
                              hintText: 'Password',
                              hintStyle:
                                  TextStyleUtil.textStyleBeforeLoginRaqiBook(
                                      context,
                                      fontSize: 14),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 20),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: CarieTextFieldWithoutLabel(
                              enableBorderColor: AppColors.instance.black,
                              obscureText: true,
                              controller: model.confirmPasswordController,
                              hintText: 'Confirm Password',
                              hintStyle:
                                  TextStyleUtil.textStyleBeforeLoginRaqiBook(
                                      context,
                                      fontSize: 14),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 20),
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
                            'Account Type : ',
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
                                'Select Type',
                                style:
                                    TextStyleUtil.textStyleBeforeLoginRaqiBook(
                                        context,
                                        fontSize: 14,
                                        color: AppColors.instance.black),
                              ),
                              value: model.dropdownValue!.isNotEmpty
                                  ? model.dropdownValue
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
                                model.updateSelectedValue(dropDownValue);
                              },
                              items: model.accountTypes
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
                      //   child: DropdownButton<String>(
                      //     hint: Text('Account Type'),
                      //     value: model.dropdownValue,
                      //     isExpanded: true,
                      //     icon: const Icon(Icons.arrow_drop_down),
                      //     iconSize: 24,
                      //     elevation: 16,
                      //     underline: SizedBox(
                      //       height: 0,
                      //       width: 0,
                      //     ),
                      //     style: TextStyleUtil.textStyleRaqiBookBold(context),
                      //     onChanged: (String? newValue) {
                      //       setState(() {
                      //         model.dropdownValue = newValue!;
                      //       });
                      //     },
                      //     items: <String>[
                      //       'Provider',
                      //       'Consumers',
                      //     ].map<DropdownMenuItem<String>>((String value) {
                      //       return DropdownMenuItem<String>(
                      //         value: value!,
                      //         child: Text(value!),
                      //       );
                      //     }).toList(),
                      //   ),
                      // ),
                      const SizedBox(
                        height: 17,
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
                            if (model.accountType ==
                                CurrentAccountType.Provider) {
                              AppUtils.navigationRoute(
                                  context: context,
                                  route: ProviderSignUpSecondScreen());
                            } else if (model.accountType ==
                                CurrentAccountType.Consumer) {
                              AppUtils.navigationRoute(
                                  context: context,
                                  route: UserSignUpSecondScreen());
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 17,
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
