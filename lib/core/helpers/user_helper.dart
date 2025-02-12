import 'package:oru_mobiles/core/constants/shared_prefs_key.dart';
import 'package:oru_mobiles/core/managers/shared_preferences_manger.dart';

class UserHelper {
  static setUserName(String name) {
    SharedPreferencesManager.setString(userName, name);
  }

  static setJoiningDate(String date) {
    SharedPreferencesManager.setString(joinedDate, date);
  }

  static setIsloggedIn(bool isLoggedIn) {
    SharedPreferencesManager.setBool(joinedDate, isLoggedIn);
  }

  static String getUserName() {
    return SharedPreferencesManager.getString(userName);
  }

  static String getJoiningDate() {
    return SharedPreferencesManager.getString(joinedDate);
  }

  static bool getIsloggedIn() {
    return SharedPreferencesManager.getBool(isUserLoggedIN);
  }
}
