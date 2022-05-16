import 'package:caireapp/screens/loginScreen/login_screen.dart';
import 'package:caireapp/util/appUtil.dart';
import 'package:caireapp/util/text.dart';
import 'package:caireapp/viewmodel/signup_viewmodel/signup_viewmodel.dart';
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
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsetsDirectional.only(
                      start: 20, end: 20, bottom: 30, top: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Caire',
                          style: TextStyleUtil.textStyleRaqiBook(context,
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
                            style: TextStyleUtil.textStyleRaqiBook(context),
                            textAlign: TextAlign.center),
                      ),
                      const SizedBox(
                        height: 19,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Name',
                          hintStyle: TextStyleUtil.textStyleRaqiBook(context),
                          focusColor: Colors.transparent,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 18, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyleUtil.textStyleRaqiBook(context),
                          focusColor: Colors.transparent,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 18, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Phone',
                          hintStyle: TextStyleUtil.textStyleRaqiBook(context),
                          focusColor: Colors.transparent,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 18, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Address',
                          hintStyle: TextStyleUtil.textStyleRaqiBook(context),
                          focusColor: Colors.transparent,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 18, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Skills',
                          hintStyle: TextStyleUtil.textStyleRaqiBook(context),
                          focusColor: Colors.transparent,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 18, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Consent',
                          hintStyle: TextStyleUtil.textStyleRaqiBook(context),
                          focusColor: Colors.transparent,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 18, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
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
                      Text(
                        'Upload License',
                        style: TextStyleUtil.textStyleRaqiBook(
                          context,
                        ),
                        // textAlign: TextAlign.l,
                      ),
                      Container(
                        width: double.infinity,
                        height: 150,
                        margin: const EdgeInsetsDirectional.only(
                            start: 30, end: 30, top: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border: Border.all(),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Choose Image',
                              style: TextStyleUtil.textStyleRaqiBook(
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
                      Text(
                        'Pick radius',
                        style: TextStyleUtil.textStyleRaqiBook(context,
                            color: Colors.black),
                      ),
                      // TextFormField(
                      //   decoration: InputDecoration(
                      //     hintText: 'Enter radius',
                      //     hintStyle: TextStyleUtil.textStyleRaqiBook(context),
                      //     focusColor: Colors.transparent,
                      //     contentPadding:
                      //     const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(12),
                      //     ),
                      //   ),
                      // ),

                      Slider(
                        value: _currentSliderValue,
                        min: 0,
                        max: 100,
                        divisions: 5,
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
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter Estimated Time',
                          hintStyle: TextStyleUtil.textStyleRaqiBook(context),
                          focusColor: Colors.transparent,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 18, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter Availability',
                          hintStyle: TextStyleUtil.textStyleRaqiBook(context),
                          focusColor: Colors.transparent,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 18, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter Price',
                          hintStyle: TextStyleUtil.textStyleRaqiBook(context),
                          focusColor: Colors.transparent,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 18, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      // const SizedBox(
                      //   height: 15,
                      // ),
                      // DropdownButton(
                      //   items: _salutations
                      //       .map((String item) =>
                      //       DropdownMenuItem<String>(child: Text(item), value: item))
                      //       .toList(),
                      //   onChanged: (String ?value) {
                      //     setState(() {
                      //       print("previous ${this._salutation}");
                      //       print("selected $value");
                      //       this._salutation = value;
                      //     });
                      //   },
                      //   value: _salutation,
                      // ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: 'Experiences',
                          hintStyle: TextStyleUtil.textStyleRaqiBook(context),
                          focusColor: Colors.transparent,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 18, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
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
                            style: TextStyleUtil.textStyleRaqiBook(context,
                                color: AppColors.instance.white),
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
                            style: TextStyleUtil.textStyleRaqiBook(context),
                          ),
                          GestureDetector(
                            onTap: () {
                              AppUtils.navigationRoute(
                                  context: context, route: LoginScreen());
                            },
                            child: Text(
                              'Log in ',
                              style: TextStyleUtil.textStyleRaqiBook(context),
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
