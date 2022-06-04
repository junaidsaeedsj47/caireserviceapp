import 'package:caireapp/util/enum.dart';
import 'package:flutter/cupertino.dart';

class ProviderSideBookingViewModel extends ChangeNotifier {
  String selectedValue = 'New Booking';
  BookingTypes bookingTypes=BookingTypes.New;
  List<String> listOfBookingServices = [
    'All',
    'New Booking',
    'In Progress',
    'Completed',
  ];

  initialize(BuildContext context) {}

  updateBookingTypes(String value) {
    selectedValue = value;
    if(value.toLowerCase()=="All".toLowerCase()){
      bookingTypes=BookingTypes.All;
    }else if(value.toLowerCase()=="New Booking".toLowerCase()){
      bookingTypes=BookingTypes.New;
    }else if(value.toLowerCase()=="In Progress".toLowerCase()){
      bookingTypes=BookingTypes.InProgress;
    }else if(value.toLowerCase()=="Completed".toLowerCase()){
      bookingTypes=BookingTypes.Completed;
    }
    notifyListeners();
  }
}
