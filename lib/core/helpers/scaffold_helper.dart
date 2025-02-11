import 'package:flutter/material.dart';

enum SnakBarType { success, error, info }

extension SnackBarTypeExtension on SnakBarType {
  Color get color {
    switch (this) {
      case SnakBarType.success:
        return Colors.green;
      case SnakBarType.error:
        return Colors.red;
      case SnakBarType.info:
        return Colors.blue;
    }
  }
}

class ScaffoldHelper {
  static Future<void> showBottomSheet(
          {required BuildContext context,
          required Widget child,
          required String title}) =>
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ]),
              child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            child,
          ],
        ),
      );

  static void showSnackBar(
      {required BuildContext context,
      required String message,
      required SnakBarType type}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: type.color,
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
