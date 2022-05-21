import 'package:caireapp/constants/constants.dart';
import 'package:caireapp/util/enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
class UserSignUpScreenViewModel extends ChangeNotifier {
  double? height;
  double? width;

  String? setTime;


  String? dateTime;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);




  String? serviceDropdownValue;
  String? offerPlaceDropdownValue = '';
  String? possessionOfTools;
  bool isToolsAvailable = false;
  String? toolsValue = '';

  // List<dynamic> accountTypes = [];
  late CurrentAccountType accountType;
  List listOfServices = [
    "Plumber",
    "Carpenter",
    "Painting",
    "Salon",
    "Smart Home",
    "AC Repair"
  ];
  List listOfTools = [
    "Plumber",
    "Carpenter",
    "Painting",
    "Salon",
    "Smart Home",
    "AC Repair"
  ];
  List serviceOfferPlace = [
    "Consumer Location",
    "Provider Location",
  ];
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cvcController = TextEditingController();
  TextEditingController expiryController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  initialize(BuildContext context) {
    serviceDropdownValue = '';
  }

  updateState() {
    notifyListeners();
  }
  updateExpiryDate(DateTime date){
    selectedDate=date;
    updateState();
  }
  updateSelectedValue(value) {
    if (value == Constants.accountTypeProvider) {
      accountType = CurrentAccountType.Provider;
    } else {
      accountType = CurrentAccountType.Consumer;
    }
    serviceDropdownValue = value!;
    updateState();
  }

  selectedPlaceOfService(value) {
    offerPlaceDropdownValue = value!;
    updateState();
  }

  updateTheToolsStatus(bool status) {
    if (status == true) {
      toolsValue = 'Yes';
    } else {
      toolsValue = "No";
    }
    isToolsAvailable = status;
    updateState();
  }}
