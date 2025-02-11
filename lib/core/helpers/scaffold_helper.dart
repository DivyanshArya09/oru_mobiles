import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oru_mobiles/core/constants/color_palatte.dart';
import 'package:oru_mobiles/themes/app_text_themes.dart';

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
        isScrollControlled: true,
        // constraints: BoxConstraints(
        //   maxHeight: MediaQuery.of(context).size.height * 0.5,
        // ),
        backgroundColor: ColorPalette.white,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
        builder: (context) => Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 64.h,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.8),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06), // Shadow color
                      offset: Offset(0, 2), // Shadow position
                      blurRadius: 2, // Shadow blur radius
                      spreadRadius: 0, // Shadow spread radius
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Text(
                      title,
                      style: AppTextThemes.of(context).bodyMedium,
                    ),
                    const Spacer(),
                    InkWell(
                      child: const Icon(
                        Icons.close,
                        color: ColorPalette.darktext,
                      ),
                      onTap: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                color: ColorPalette.white,
                child: SingleChildScrollView(child: child),
              ),
            ],
          ),
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
