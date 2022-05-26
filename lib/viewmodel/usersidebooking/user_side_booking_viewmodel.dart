import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class UserSideBookingViewModel extends ChangeNotifier{
  int selectedIndex = 0;
  TextEditingController userAddressField=TextEditingController();
  DateTime selectedTime=DateTime.now();
  DateTime selectedDate=DateTime.now();
  initialize(BuildContext context) {}
  void onItemTapped(int index) {
    selectedIndex = index;
    debugPrint('SelectedIndex');
    notifyListeners();
  }
  updateState() {
    notifyListeners();
  }
  updateSelectedTime(DateTime date){
    selectedTime = date;
    updateState();
  }
  updateSelectedDate(DateTime date){
    selectedDate = date;
    updateState();
  }
}