import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oru_mobiles/core/constants/figma_constants.dart';
import 'package:oru_mobiles/core/managers/app_manager.dart';
import 'package:oru_mobiles/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:oru_mobiles/routes/custom_navigator.dart';
import 'package:oru_mobiles/themes/app_themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppManager.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(VALUE_FIGMA_WIDTH, VALUE_FIGMA_HEIGHT),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: kNavigatorKey,
        onGenerateRoute: CustomNavigator.controller,
        // initialRoute: AppRouter.splashScreen,
        title: 'Oru Mobiles',
        theme: AppThemes.lightTheme,
        home: const SignUpScreen(),
      ),
    );
  }
}
