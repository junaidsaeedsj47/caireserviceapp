import 'package:flutter/cupertino.dart';

class ReScheduleBookingViewModel extends ChangeNotifier{
  TextEditingController scheduleComment = TextEditingController();
  DateTime selectedTime=DateTime.now();
  DateTime selectedDate=DateTime.now();
  bool showDate=false;
  bool showTime=false;

  initialize(BuildContext context){}
  updateState() {
    notifyListeners();
  }
  updateSelectedTime(DateTime date){
    selectedTime = date;
    showTime=true;
    updateState();
  }
  updateSelectedDate(DateTime date){
    selectedDate = date;
    showDate=true;
    updateState();
  }
}