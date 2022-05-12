import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/caireColors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String dropDownValue='yes';
  String ? _salutation = "Yes";
  final _salutations = ["Yes.", "No",];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsetsDirectional.only(
              start: 20, end: 20, bottom: 30, top: 40),
          child: Column(
            children: [
              // Image.asset(
              //   AmericanTaxiImageConstants.Common + 'logo.png',
              //   height: 86,
              // ),
              const SizedBox(
                height: 27,
              ),
              Text('Enter Details For Sign-Up',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 19,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Name',
                  hintStyle: const TextStyle(color: Color(0xffB4B4B4)),
                  focusColor: Colors.transparent,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
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
                  hintStyle: const TextStyle(color: Color(0xffB4B4B4)),
                  focusColor: Colors.transparent,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
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
                  hintStyle: const TextStyle(color: Color(0xffB4B4B4)),
                  focusColor: Colors.transparent,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
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
                  hintStyle: const TextStyle(color: Color(0xffB4B4B4)),
                  focusColor: Colors.transparent,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
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
                  hintStyle: const TextStyle(color: Color(0xffB4B4B4)),
                  focusColor: Colors.transparent,
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
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
                  hintStyle: const TextStyle(color: Color(0xffB4B4B4)),
                  focusColor: Colors.transparent,
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
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
                  hintText: 'Enter radius',
                  hintStyle: const TextStyle(color: Color(0xffB4B4B4)),
                  focusColor: Colors.transparent,
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
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
                  hintText: 'Enter Estimated Time',
                  hintStyle: const TextStyle(color: Color(0xffB4B4B4)),
                  focusColor: Colors.transparent,
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
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
                  hintStyle: const TextStyle(color: Color(0xffB4B4B4)),
                  focusColor: Colors.transparent,
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
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
                  hintStyle: const TextStyle(color: Color(0xffB4B4B4)),
                  focusColor: Colors.transparent,
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
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
                  hintStyle: const TextStyle(color: Color(0xffB4B4B4)),
                  focusColor: Colors.transparent,

                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
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
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
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
              RichText(
                text: TextSpan(
                  text: 'Have an account ? ',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                  children: const <TextSpan>[
                    TextSpan(
                        text: 'Log in ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
