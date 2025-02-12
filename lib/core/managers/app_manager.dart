import 'package:flutter/services.dart';
import 'package:oru_mobiles/core/constants/color_palatte.dart';
import 'package:oru_mobiles/core/managers/shared_preferences_manger.dart';
import 'package:oru_mobiles/injection_container/injection_container.dart' as di;

class AppManager {
  static Future<void> initialize() async {
    await di.init();
    await SharedPreferencesManager.init();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: ColorPalette.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );
  }
}
