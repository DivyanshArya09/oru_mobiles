import 'dart:async';

import 'package:oru_mobiles/core/constants/shared_prefs_key.dart';
import 'package:oru_mobiles/core/managers/shared_preferences_manger.dart';
import 'package:oru_mobiles/routes/app_routes.dart';
import 'package:oru_mobiles/routes/custom_navigator.dart';

StreamController<bool> userAuthStream = StreamController.broadcast();

class UserHelper {
  static setUserName(String name) {
    SharedPreferencesManager.setString(userName, name);
  }

  static setJoiningDate(String date) {
    SharedPreferencesManager.setString(joinedDate, date);
  }

  static setIsloggedIn(bool isLoggedIn) {
    SharedPreferencesManager.setBool(isUserLoggedIN, isLoggedIn);
    UserAuthStream.broadcastStream(isLoggedIn);
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

  static bool getIsCurrentProductLiked() {
    return SharedPreferencesManager.getBool(isCurrentProductLiked);
  }

  static void logOut() {
    SharedPreferencesManager.removeKey(isUserLoggedIN);
    SharedPreferencesManager.removeKey(userName);
    SharedPreferencesManager.removeKey(joinedDate);

    kNavigatorKey.currentState!
        .pushNamedAndRemoveUntil(AppRouter.splashScreen, (route) => false);
    userAuthStream.close();
  }
}

class UserAuthStream {
  static Stream<bool> getUserAuthStream() => userAuthStream.stream;

  static void broadcastStream(bool value) {
    userAuthStream.sink.add(value);
  }
}
