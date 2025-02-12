import 'package:flutter/services.dart';
import 'package:oru_mobiles/injection_container/injection_container.dart' as di;

class AppManager {
  static Future<void> initialize() async {
    await di.init();
    await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );
  }
}
