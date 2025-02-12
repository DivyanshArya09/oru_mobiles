import 'package:flutter/material.dart';
import 'package:oru_mobiles/features/auth/presentation/screens/otp_screen.dart';
import 'package:oru_mobiles/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:oru_mobiles/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:oru_mobiles/features/home/presentation/screens/home_screen.dart';
import 'package:oru_mobiles/features/onboarding/presentation/splash_screen.dart';
import 'package:oru_mobiles/routes/app_routes.dart';

final kNavigatorKey = GlobalKey<NavigatorState>();

class CustomNavigator {
  CustomNavigator._();

  static Route<dynamic> controller(RouteSettings settings) {
    switch (settings.name) {
      case AppRouter.login:
        return MaterialPageRoute(
          builder: (context) => const SignInScreen(),
          settings: settings,
        );
      case AppRouter.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
          settings: settings,
        );

      case AppRouter.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
          settings: settings,
        );

      case AppRouter.otp:
        return MaterialPageRoute(
          builder: (context) => OtpScreen(
            phoneNumber: settings.arguments as String,
          ),
          settings: settings,
        );

      case AppRouter.register:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
          settings: settings,
        );
      default:
        throw ('This route name does not exit');
    }
  }

  // Pushes to the route specified
  static Future<T?> pushTo<T extends Object?>(
    BuildContext context,
    String strPageName, {
    Object? arguments,
  }) async {
    return await Navigator.of(context, rootNavigator: true)
        .pushNamed(strPageName, arguments: arguments);
  }

  // Pop the top view
  static void pop(BuildContext context, {Object? result}) {
    Navigator.pop(context, result);
  }

  // Pops to a particular view
  static Future<T?> popTo<T extends Object?>(
    BuildContext context,
    String strPageName, {
    Object? arguments,
  }) async {
    return await Navigator.popAndPushNamed(
      context,
      strPageName,
      arguments: arguments,
    );
  }

  static void popUntilFirst(BuildContext context) {
    Navigator.popUntil(context, (page) => page.isFirst);
  }

  static void popUntilRoute(BuildContext context, String route, {var result}) {
    Navigator.popUntil(context, (page) {
      if (page.settings.name == route && page.settings.arguments != null) {
        (page.settings.arguments as Map<String, dynamic>)["result"] = result;
        return true;
      }
      return false;
    });
  }

  static Future<T?> pushAndRemoveUntil<T extends Object?>(
    BuildContext context,
    String strPageName, {
    Object? arguments,
  }) async {
    return Navigator.pushNamedAndRemoveUntil(
      context,
      strPageName,
      (route) => false,
      arguments: arguments,
    );
  }

  static Future<T?> pushReplace<T extends Object?>(
    BuildContext context,
    String strPageName, {
    Object? arguments,
  }) async {
    return await Navigator.pushReplacementNamed(
      context,
      strPageName,
      arguments: arguments,
    );
  }
}
