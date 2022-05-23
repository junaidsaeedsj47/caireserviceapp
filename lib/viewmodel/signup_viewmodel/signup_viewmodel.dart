import 'package:caireapp/constants/constants.dart';
import 'package:caireapp/util/enum.dart';
import 'package:flutter/cupertino.dart';

class SignUpScreenViewModel extends ChangeNotifier {
  String? dropdownValue;
  List<dynamic> accountTypes = [
    'Provider',
    'Consumer',
  ];
  CurrentAccountType? accountType;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  initialize(BuildContext context) {
    dropdownValue = '';
  }

  updateSelectedValue(value) {
    if (value == Constants.accountTypeProvider) {
      accountType = CurrentAccountType.Provider;
    } else {
      accountType = CurrentAccountType.Consumer;
    }
    dropdownValue = value!;
    notifyListeners();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    addressController.dispose();
  }
}
