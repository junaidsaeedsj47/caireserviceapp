import 'package:shared_preferences/shared_preferences.dart';

class UserDefaults {
  static UserDefaults _userDefaults = UserDefaults._();

  static UserDefaults getInstance() {
    return _userDefaults;
  }
  UserDefaults._();
}