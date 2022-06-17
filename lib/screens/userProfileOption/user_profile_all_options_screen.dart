import 'package:auto_size_text/auto_size_text.dart';
import 'package:caireapp/screens/loginScreen/login_screen.dart';
import 'package:caireapp/screens/profile/profile_screen.dart';
import 'package:caireapp/util/appUtil.dart';
import 'package:caireapp/util/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
      stream: null,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppUtils.showAppBar(showBack: false,title: "Profile",context: context),
          body: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          'https://preview.keenthemes.com/metronic-v4/theme/assets/pages/media/profile/profile_user.jpg'),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: AutoSizeText(
                        "User" ?? "",
                        style: TextStyleUtil.textStyleRaqiBook(context,fontSize: 20,),
                      ),
                    ),
                  ],
                ),
                // decoration: BoxDecoration(
                //     color: Colors.green,
                //     image: DecorationImage(
                //         fit: BoxFit.fill,
                //         image: AssetImage('assets/images/cover.jpg'))),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
                onTap: () => {AppUtils.pushRoute(context: context, route: ProfileScreen())},
              ),
              ListTile(
                leading: Icon(Icons.input),
                title: Text('Saved Bookings'),
                onTap: () => {},
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () => {},
              ),
              ListTile(
                leading: Icon(Icons.border_color),
                title: Text('Feedback'),
                onTap: () => {},
              ),
              ListTile(
                leading: Icon(Icons.perm_contact_cal_rounded),
                title: Text('Contact Us'),
                onTap: () => {},
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () =>
                {AppUtils.pushAndRemove(context, LoginScreen())},
              ),
            ],
          ),
        );
      }
    );
  }
}
