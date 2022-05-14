import 'package:flutter/cupertino.dart';

class DashboardViewModel extends ChangeNotifier {
  int selectedIndex = 0;
  bool activeColors = false;
  List lisOfCategories=["Plumber","Carpenter","Painting","Salon","Smart Home","AC Repair"];
  initialize(BuildContext context) {}

  void onItemTapped(int index) {
    selectedIndex = index;
    debugPrint('SelectedIndex');
    notifyListeners();
  }

  setActiveButton(bool value,int index) {
    if (value == true && index==1) {
      activeColors = value;
    } else {
      activeColors = value;
    }
    notifyListeners();
  }
}
