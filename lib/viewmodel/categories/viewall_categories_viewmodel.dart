import 'package:flutter/cupertino.dart';

class ViewAllCategoriesViewModel extends ChangeNotifier {
  int selectedIndex = 0;
  bool activeColors = false;
  final List<String> imgList = [
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
    "AC Repair",
    "Cleaning",
    "Virtual Assistant"
  ];
  List<ServiceModel> servicesData = [];

  initialize(BuildContext context) {

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
