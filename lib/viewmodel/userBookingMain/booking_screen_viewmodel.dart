import 'package:caireapp/model/service_data_model.dart';
import 'package:caireapp/util/enum.dart';
import 'package:flutter/cupertino.dart';

class BookingMainViewModel extends ChangeNotifier {
  String selectedValue = 'All';
  BookingTypes bookingTypes=BookingTypes.InProgress;
  List<TabBarModelUser> userTabBarItems = [];
  bool tabSelected = false;
  int? currentIndex=0;
  bool showLoader=false;
  List<String> listOfBookingServices = [
    'All',
    'New Booking',
    'In Progress',
    'Completed',
  ];
  List<ServiceModel> servicesData = [];
  initialize(BuildContext context) {
    servicesData.addAll([
    ServiceModel(
    serviceImage:
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    serviceName: "Fixing TV Wire",
    servicePricing: "150",
    serviceProviderName: "Esther Howard",
    serviceProviderRating: 2.3,
    serviceDiscount: 10,
    serviceDuration:1,
    descriptionOfService: "Lorem ipsum dolor sit mit is a dumy text.ipsum dolor sit mit is a dumy text ",
    ),]);
    userTabBarItems.addAll([
      TabBarModelUser(tabTitle: "In Progress", tabIndex: 0),
      TabBarModelUser(tabTitle: "Waiting Provider", tabIndex: 1),
      TabBarModelUser(tabTitle: "Scheduled", tabIndex: 2),
      TabBarModelUser(tabTitle: "Completed", tabIndex: 3),
      TabBarModelUser(tabTitle: "Cancelled", tabIndex: 4),
    ]);
  }

  selectedTabView(int? index) {
    if (index == 0) {
      currentIndex=index;
      bookingTypes = BookingTypes.InProgress;
      showLoader=true;
      dismissLoader(showLoader);
    } else if (index == 1) {
      currentIndex=index;
      bookingTypes = BookingTypes.WaitingProvider;
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
      Future.delayed(Duration(seconds: 2),(){
        showLoader=false;
        notifyListeners();
      });
    }
  }
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
class TabBarModelUser {
  String? tabTitle;
  int? tabIndex;

  TabBarModelUser({this.tabTitle, this.tabIndex});
}
