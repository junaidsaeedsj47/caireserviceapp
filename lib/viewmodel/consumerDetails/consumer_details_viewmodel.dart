
import 'package:caireapp/model/provider_data_model.dart';
import 'package:caireapp/model/service_data_model.dart';
import 'package:flutter/cupertino.dart';

class ConsumerDetailsViewModel extends ChangeNotifier {
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
    "AC Repair"
  ];
  List<ProviderDetails> providerDetails = [];
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
      ),
      ServiceModel(
          serviceImage:
          'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
          serviceName: "Fixing Android Smart Devices",
          servicePricing: "300",
          serviceProviderName: "Darlene Robertson",
          serviceDuration: 4,
          descriptionOfService: "Lorem ipsum dolor sit mit is a dumy text ipsum dolor sit mit is a dumy text ",
          serviceProviderRating: 4.3),
      ServiceModel(
          serviceImage:
          'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
          serviceName: "Sanitary Wiring",
          servicePricing: "1000",
          serviceProviderName: "Arthur David",
          serviceDuration: 10,
          serviceDiscount: 5,
          descriptionOfService: "Lorem ipsum dolor sit mit is a dumy text.ipsum dolor sit mit is a dumy text ",
          serviceProviderRating: 3),
      ServiceModel(
          serviceImage:
          'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
          serviceName: "House Cleaning",
          servicePricing: "100",
          serviceProviderName: "Devon Lane",
          serviceDuration: 5,
          descriptionOfService: "Lorem ipsum dolor sit mit is a dumy text.ipsum dolor sit mit is a dumy text ",
          serviceProviderRating: 4.4),
    ]);
    providerDetails.addAll([
      ProviderDetails(
        providerProfileImage:
        'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
        providerJobTitle: "Fixing TV Wire",
        providerPhoneNumber: "+922423422221",
        providerName: "Esther Howard",
        providerRating: 2.3,
        providerMemberSince:"2022",
        userSummaryDetails: "Lorem ipsum dolor sit mit is a dumy text.ipsum dolor sit mit is a dumy text ",
        isUserActive: true,
        providerEmail: "test@caire.com",
      ),
    ]);
  }

  int getStarToShow(double ratingNo) {
    int starToShow = 0;
    if (ratingNo == 1 || ratingNo < 2) {
      starToShow = 1;
      debugPrint('starToShow' + starToShow.toString());
    } else if (ratingNo == 2 || ratingNo < 3) {
      starToShow = 2;
      debugPrint('starToShow' + starToShow.toString());
    } else if (ratingNo == 3 || ratingNo < 4) {
      starToShow = 3;
      debugPrint('starToShow' + starToShow.toString());
    } else if (ratingNo == 4 || ratingNo < 5) {
      starToShow = 4;
      debugPrint('starToShow' + starToShow.toString());
    } else {
      starToShow = 5;
      debugPrint('starToShow' + starToShow.toString());
    }
    return starToShow;
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


