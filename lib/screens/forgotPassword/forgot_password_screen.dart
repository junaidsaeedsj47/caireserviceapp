import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/caireColors.dart';
import '../../widgets/caire_fields.dart';


class PasswordResetScreen extends StatefulWidget {
  const PasswordResetScreen({Key ?key}) : super(key: key);

  @override
  _PasswordResetScreenState createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  TextEditingController controller = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin:
          const EdgeInsetsDirectional.only(start: 20, end: 20, bottom: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 35,
              ),
              Text(
                'Password Reset',
                style: TextStyle(
                    color: AppColors
                        .instance.themeColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 21),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),

              Container(
                margin: const EdgeInsetsDirectional.only(
                    start: 20, end: 20,top: 10),
                child: CarieTextFieldWithoutLabel(
                  controller: controller,
                  hintText: 'Password',
suffix: Icon(Icons.remove_red_eye),
                  //  labelText: 'Search Name',
                ),
              ),

              const SizedBox(
                height: 13,
              ),
              Container(
                margin: const EdgeInsetsDirectional.only(
                    start: 20, end: 20,top: 10),
                child: CarieTextFieldWithoutLabel(
                  controller: controller,
                  hintText: 'Confirm Password',
                  suffix: Icon(Icons.remove_red_eye),
                  //  labelText: 'Search Name',
                ),
              ),

              const SizedBox(
                height: 27,
              ),
              Container(
                height: 50,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors
                      .instance.themeColor,
                  child: Text(
                    'Change Password',
                    style: TextStyle(
                        color: AppColors
                            .instance.white,
                        fontSize: 20,
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
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


