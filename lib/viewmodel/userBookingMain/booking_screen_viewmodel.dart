import 'package:caireapp/model/service_data_model.dart';
import 'package:caireapp/util/enum.dart';
import 'package:flutter/cupertino.dart';

class BookingMainViewModel extends ChangeNotifier {
  String selectedValue = 'All';
  BookingTypes bookingTypes=BookingTypes.All;
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
