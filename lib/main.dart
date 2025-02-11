import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oru_mobiles/core/constants/figma_constants.dart';
import 'package:oru_mobiles/features/auth/screens/otp_screen.dart';
import 'package:oru_mobiles/themes/app_themes.dart';

void main() {
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
        title: 'Oru Mobiles',
        theme: AppThemes.lightTheme,
        home: const OtpScreen(),
      ),
    );
  }
}
