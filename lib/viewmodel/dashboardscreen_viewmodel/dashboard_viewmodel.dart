import 'package:flutter/cupertino.dart';

class DashboardViewModel extends ChangeNotifier {
  int selectedIndex = 0;
  bool activeColors = false;
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  List lisOfCategories = [
    "Plumber",
    "Carpenter",
    "Painting",
    "Salon",
    "Smart Home",
    "AC Repair"
  ];
  List<ServiceModel> servicesData = [];

  initialize(BuildContext context) {
    servicesData.addAll([
      ServiceModel(
          serviceImage: 'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
          serviceName: "Fixing TV Wire",
          servicePricing: "150",
          serviceProviderName: "Esther Howard",
          serviceProviderRating: 4.3),
      ServiceModel(
        serviceImage: 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
          serviceName: "Painting For Home",
          servicePricing: "500",
          serviceProviderName: "Dianne Russell",
          serviceProviderRating: 4.5),
      ServiceModel(
        serviceImage: 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
          serviceName: "Fixing Android Smart Devices",
          servicePricing: "300",
          serviceProviderName: "Darlene Robertson",
          serviceProviderRating: 4.3),
      ServiceModel(
        serviceImage: 'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
          serviceName: "Sanitary Wiring",
          servicePricing: "1000",
          serviceProviderName: "Arthur David",
          serviceProviderRating: 4.3),
      ServiceModel(
        serviceImage:  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
          serviceName: "House Cleaning",
          servicePricing: "100",
          serviceProviderName: "Devon Lane",
          serviceProviderRating: 4.3),
    ]);
  }

  void onItemTapped(int index) {
    selectedIndex = index;
    debugPrint('SelectedIndex');
    notifyListeners();
  }

  setActiveButton(bool value, int index) {
    if (value == true && index == 1) {
      activeColors = value;
    } else {
      activeColors = value;
    }
    notifyListeners();
  }
}

class ServiceModel {
  String? serviceImage;
  String? serviceName;
  String? servicePricing;
  double? serviceProviderRating;
  String? serviceProviderName;

  ServiceModel(
      {this.serviceImage,
      this.serviceName,
      this.servicePricing,
      this.serviceProviderName,
      this.serviceProviderRating});
}
