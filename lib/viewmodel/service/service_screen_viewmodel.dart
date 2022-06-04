import 'package:caireapp/model/service_data_model.dart';
import 'package:flutter/cupertino.dart';

class ServiceScreenViewModel extends ChangeNotifier{
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
  }
}