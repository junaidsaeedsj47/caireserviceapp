import 'package:flutter/cupertino.dart';

class UserSideBookingSecondViewModel extends ChangeNotifier{
  int selectedIndex = 0;
  TextEditingController userAddressField=TextEditingController();
  initialize(BuildContext context) {}
  void onItemTapped(int index) {
    selectedIndex = index;
    debugPrint('SelectedIndex');
    notifyListeners();
  }
}