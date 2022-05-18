import 'package:flutter/cupertino.dart';

class ServiceDetailsViewModel extends ChangeNotifier{
  int selectedIndex = 0;
  initialize(BuildContext context) {}
  void onItemTapped(int index) {
    selectedIndex = index;
    debugPrint('SelectedIndex');
    notifyListeners();
  }
}