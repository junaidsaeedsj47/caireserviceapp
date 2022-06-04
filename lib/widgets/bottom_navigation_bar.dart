import 'package:caireapp/constants/caireColors.dart';
import 'package:caireapp/screens/chat/chat_screen.dart';
import 'package:caireapp/screens/dashboardScreen/dashboardScreen.dart';
import 'package:caireapp/screens/profile/profile_screen.dart';
import 'package:caireapp/screens/userBookingMain/booking_screen.dart';
import 'package:caireapp/util/enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class AppBottomVar extends StatefulWidget {
//   const AppBottomVar({Key? key}) : super(key: key);
//
//   @override
//   _AppBottomVarState createState() => _AppBottomVarState();
// }
//
// class _AppBottomVarState extends State<AppBottomVar> {
//   int currentIndex = 0;
//   BottomBarType _selectedType = BottomBarType.Dashboard;
//
//   final List<Widget> screens = [
//     const DashboardScreen(),
//     const ChatScreen(),
//     const BookingScreen(),
//     const DashboardScreen(),
//   ];
//
//   ///getters
//   get getCurrentIndex => currentIndex;
//
//   get getCurrentSelectedType => _selectedType;
//
//   get getCurrentScreen => screens;
//
//   void changeSelectedScreen(int index) {
//     switch (index) {
//       case 0:
//         currentIndex = 0;
//         _selectedType = BottomBarType.Dashboard;
//         break;
//       case 1:
//         currentIndex = 1;
//         _selectedType = BottomBarType.Chat;
//         break;
//       case 2:
//         currentIndex = 2;
//         _selectedType = BottomBarType.Orders;
//         break;
//       default:
//         currentIndex = 3;
//         _selectedType = BottomBarType.Profile;
//     }
//     setState(() {
//
//     });
//   }
//   @override
//   void initState() {
//     // TODO: implement initState
//     changeSelectedScreen(0);
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//           showSelectedLabels: false,
//           showUnselectedLabels: false,
//           items: <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               activeIcon: Icon(
//                 Icons.home,
//                 color: AppColors.instance.themeColor,
//               ),
//               icon: Icon(
//                 Icons.home,
//                 color: AppColors.instance.appIconColor,
//               ),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//                 activeIcon: Icon(
//                   Icons.chat,
//                   color: AppColors.instance.themeColor,
//                 ),
//                 icon: Icon(
//                   Icons.chat,
//                   color: AppColors.instance.appIconColor,
//                 ),
//                 label: 'Chat',
//                 backgroundColor: Colors.yellow),
//             BottomNavigationBarItem(
//               activeIcon: Icon(
//                 Icons.notifications,
//                 color: AppColors.instance.themeColor,
//               ),
//               icon: Icon(
//                 Icons.event_note_rounded,
//                 color: AppColors.instance.appIconColor,
//               ),
//               label: 'Orders',
//               backgroundColor: Colors.blue,
//             ),
//             BottomNavigationBarItem(
//               activeIcon: Icon(
//                 Icons.person,
//                 color: AppColors.instance.themeColor,
//               ),
//               icon: Icon(
//                 Icons.person,
//                 color: AppColors.instance.appIconColor,
//               ),
//               label: 'Profile',
//               backgroundColor: Colors.blue,
//             ),
//           ],
//           type: BottomNavigationBarType.fixed,
//           currentIndex: currentIndex,
//           selectedItemColor: AppColors.instance.appIconColor,
//           iconSize: 25,
//           onTap: (index) {
//         changeSelectedScreen(index);
//           },
//           elevation: 5),
//       body: screens[currentIndex],
//     );
//   }
// }

// class CustomBottomNavigationBar extends ChangeNotifier {
//   int currentIndex = 0;
//   BottomBarType _selectedType = BottomBarType.Dashboard;
//
//   final List<Widget> screens = [
//     const DashboardScreen(),
//     const ChatScreen(),
//     const BookingScreen(),
//     const DashboardScreen(),
//   ];
//
//   ///getters
//   get getCurrentIndex => currentIndex;
//
//   get getCurrentSelectedType => _selectedType;
//
//   get getCurrentScreen => screens;
//
//   void changeSelectedScreen(int index) {
//     switch (index) {
//       case 0:
//         currentIndex = 0;
//         _selectedType = BottomBarType.Dashboard;
//         break;
//       case 1:
//         currentIndex = 1;
//         _selectedType = BottomBarType.Chat;
//         break;
//       case 2:
//         currentIndex = 2;
//         _selectedType = BottomBarType.Orders;
//         break;
//       default:
//         currentIndex = 3;
//         _selectedType = BottomBarType.Profile;
//     }
//     notifyListeners();
//   }
// }
class AppBottomBar extends StatefulWidget {
  final List bottomBarPages;
  const AppBottomBar({Key? key,required this.bottomBarPages}) : super(key: key);

  @override
  _AppBottomBarState createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  int pageIndex = 0;

  // final pages = [
  //    DashboardScreen(),
  //    ChatScreen(),
  //    BookingMainScreen(),
  //    ProfileScreen(),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.bottomBarPages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.instance.backGroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            icon: pageIndex == 0
                ?  Icon(
              Icons.home,
              color: AppColors.instance.themeColor,
              size: 25,
            )
                : const Icon(
              Icons.home,
              color: Colors.black,
              size: 25,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon: pageIndex == 1
                ?  Icon(
              Icons.chat,
              color: AppColors.instance.themeColor,
              size: 25,
            )
                : const Icon(
              Icons.chat,
              color: Colors.black,
              size: 25,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
            },
            icon: pageIndex == 2
                ?  Icon(
              Icons.event_note_sharp,
              color:AppColors.instance.themeColor,
              size: 25,
            )
                : const Icon(
              Icons.event_note_sharp,
              color: Colors.black,
              size: 25,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 3;
              });
            },
            icon: pageIndex == 3
                ?  Icon(
              Icons.person,
              color:AppColors.instance.themeColor,
              size: 25,
            )
                : const Icon(
              Icons.person,
              color: Colors.black,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}