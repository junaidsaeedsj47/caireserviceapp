import 'package:caireapp/util/enum.dart';
import 'package:flutter/cupertino.dart';

class ProviderSideBookingViewModel extends ChangeNotifier {
  String selectedValue = 'New Booking';
  BookingTypes bookingTypes = BookingTypes.New;
  bool tabSelected = false;
  int? currentIndex=0;
  bool showLoader=false;
  List<String> listOfBookingServices = [
    'All',
    'New Booking',
    'In Progress',
    'Completed',
  ];
  List<TabBarModel> tabBarItems = [];

  initialize(BuildContext context) {
    tabBarItems.addAll([
      TabBarModel(tabTitle: "New Booking", tabIndex: 0),
      TabBarModel(tabTitle: "In Progress", tabIndex: 1),
      TabBarModel(tabTitle: "Scheduled", tabIndex: 2),
      TabBarModel(tabTitle: "Completed", tabIndex: 3),
      TabBarModel(tabTitle: "Cancelled", tabIndex: 4),
    ]);
  }

  selectedTabView(int? index) {
    if (index == 0) {
      currentIndex=index;
      bookingTypes = BookingTypes.New;
      showLoader=true;
      dismissLoader(showLoader);
    } else if (index == 1) {
      currentIndex=index;
      bookingTypes = BookingTypes.InProgress;
      showLoader=true;
      dismissLoader(showLoader);
    } else if (index == 2) {
      currentIndex=index;
      bookingTypes = BookingTypes.Scheduled;
      showLoader=true;
      dismissLoader(showLoader);
    } else if (index == 3) {
      currentIndex=index;
      bookingTypes = BookingTypes.Completed;
      showLoader=true;
      dismissLoader(showLoader);
    }else if (index == 4) {
      currentIndex=index;
      bookingTypes = BookingTypes.Cancelled;
      showLoader=true;
      dismissLoader(showLoader);
    }
    notifyListeners();
  }
  dismissLoader(bool value){
    if(value){
      Future.delayed(Duration(seconds: 1),(){
         showLoader=false;
         notifyListeners();
      });
    }
  }
  updateBookingTypes(String value) {
    selectedValue = value;
    if (value.toLowerCase() == "All".toLowerCase()) {
      bookingTypes = BookingTypes.All;
    } else if (value.toLowerCase() == "New Booking".toLowerCase()) {
      bookingTypes = BookingTypes.New;
    } else if (value.toLowerCase() == "In Progress".toLowerCase()) {
      bookingTypes = BookingTypes.InProgress;
    } else if (value.toLowerCase() == "Completed".toLowerCase()) {
      bookingTypes = BookingTypes.Completed;
    }
    notifyListeners();
  }
}

class TabBarModel {
  String? tabTitle;
  int? tabIndex;

  TabBarModel({this.tabTitle, this.tabIndex});
}
