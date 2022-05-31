import 'package:caireapp/constants/caireColors.dart';
import 'package:caireapp/util/appUtil.dart';
import 'package:caireapp/util/text.dart';
import 'package:caireapp/viewmodel/profile/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ProfileScreen extends StatefulWidget {
  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  ProfileScreenViewModel profileScreenViewModel = ProfileScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileScreenViewModel>.reactive(
        viewModelBuilder: () => profileScreenViewModel,
        onModelReady: (model) {
          model.initialize(context);
        },
        builder: (buildContext, model, index) {
          return SafeArea(
            child: Scaffold(
              appBar: AppUtils.showAppBar(showBack: false,title: "Profile",context: context),
              body: Container(
                // decoration: BoxDecoration(
                //     gradient: LinearGradient(
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                //   colors: [
                //     AppColors.instance.splashColorThree,
                //     // AppColors.instance.splashColorOne,
                //     AppColors.instance.splashColorTwo,
                //   ],
                // )),
                child: ListView(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          height: 250.0,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: Stack(
                                    fit: StackFit.loose,
                                    alignment: AlignmentDirectional.center,
                                    children: <Widget>[
                                      //================
                                      //Profile Image
                                      //================
                                      _buildProfileImage(),

                                      //=============
                                      //Camera Icon
                                      //=============
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: 100.0, right: 90.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              GestureDetector(
                                                onTap: () {
                                                  // chooseFile();
                                                  setState(() {
                                                    //    showSpinner = false;
                                                  });
                                                },
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.grey,
                                                  radius: 20.0,
                                                  child: Icon(
                                                    Icons.camera_alt,
                                                    color: Colors.white,
                                                    size: 20,
                                                  ),
                                                ),
                                              )
                                            ],
                                          )),
                                    ]),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 30),
                                child: Text(
                                  "User",
                                  style: TextStyleUtil.textStyleRaqiBookBold(
                                      context,
                                      fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Divider(
                          height: 5,
                          color: Colors.grey,
                        ),
                        Container(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 25.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: Text(
                                      'E-Mail',
                                      style: TextStyleUtil.textStyleRaqiBookBold(
                                        context,
                                      ),
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 6.0),
                                    child: Text(
                                      "test@gmail.com",
                                      style: TextStyleUtil.textStyleRaqiBookBold(
                                          context,
                                          fontSize: 14),
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: Text(
                                      "Phone Number",
                                      style: TextStyleUtil.textStyleRaqiBookBold(
                                        context,
                                      ),
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 6.0),
                                    child: Text(
                                      "+923111110000",
                                      style: TextStyleUtil.textStyleRaqiBookBold(
                                          context,
                                          fontSize: 14),
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            child: Text(
                                              'City',
                                              style: TextStyleUtil
                                                  .textStyleRaqiBookBold(
                                                context,
                                              ),
                                            ),
                                          ),
                                          flex: 2,
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: Text(
                                              'Country',
                                              style: TextStyleUtil
                                                  .textStyleRaqiBookBold(
                                                context,
                                              ),
                                            ),
                                          ),
                                          flex: 2,
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 2.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            child: Text(
                                              "Islamabad",
                                              style: TextStyleUtil
                                                  .textStyleRaqiBookBold(context,
                                                      fontSize: 14),
                                            ),
                                          ),
                                          flex: 2,
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: Text(
                                              "Pakistan",
                                              style: TextStyleUtil
                                                  .textStyleRaqiBookBold(context,
                                                      fontSize: 14),
                                            ),
                                          ),
                                          flex: 2,
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ),

                        //===================
                        //Bottom Section
                        //===================
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  _buildProfileImage() {
    return Container(
        width: 140.0,
        height: 140.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 4, color: Colors.grey),
          image: DecorationImage(
            image: NetworkImage(
                'https://preview.keenthemes.com/metronic-v4/theme/assets/pages/media/profile/profile_user.jpg'),
            fit: BoxFit.cover,
          ),
        ));
  }
}
