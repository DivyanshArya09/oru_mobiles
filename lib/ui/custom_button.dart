import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oru_mobiles/core/constants/color_palatte.dart';
import 'package:oru_mobiles/core/constants/figma_constants.dart';
import 'package:oru_mobiles/ui/molecules/bouncing_widget.dart';

enum ButtonType { primary, secondary }

class CustomButton extends StatelessWidget {
  final String strButtonText;
  final bool isDisabled;
  final VoidCallback buttonAction;
  final double dCornerRadius;
  final bool isLoading;
  final double dHeight, dWidth;
  final Color borderColor;
  final Color bgColor;
  final Color textColor;
  final TextAlign buttonTextAlignment;
  final Widget? buttonIcon;
  final MainAxisAlignment mainAxisAlignment;
  final TextStyle? textStyle;
  final Icon? icon;
  final ButtonType buttonType;

  const CustomButton({
    Key? key,
    required this.strButtonText,
    this.dWidth = double.infinity,
    required this.buttonAction,
    this.dCornerRadius = BUTTON_BORDER_RADIUS,
    this.borderColor = ColorPalette.primary,
    this.isLoading = false,
    this.bgColor = ColorPalette.primary,
    this.textColor = ColorPalette.white,
    this.isDisabled = false,
    this.buttonTextAlignment = TextAlign.center,
    this.dHeight = BUTTON_HEIGHT,
    this.buttonIcon,
    this.textStyle = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: ColorPalette.white,
    ),
    this.icon,
    this.mainAxisAlignment = MainAxisAlignment.spaceAround,
    this.buttonType = ButtonType.primary,
  }) : super(key: key);

  factory CustomButton.icon({
    required String strButtonText,
    required VoidCallback buttonAction,
    Color borderColor = ColorPalette.lightGrey,
    required Icon icon,
    Color bgColor = ColorPalette.primary,
    double? borderRadius = BUTTON_BORDER_RADIUS,
    ButtonType buttonType = ButtonType.primary,
    bool? isLoading = false,
    bool? isDisabled = false,
  }) {
    return CustomButton(
      strButtonText: strButtonText,
      buttonAction: buttonAction,
      buttonIcon: icon,
      icon: icon,
      bgColor: bgColor,
      dCornerRadius: borderRadius!,
      borderColor: borderColor,
      buttonType: buttonType,
      isLoading: isLoading!,
      isDisabled: isDisabled!,
    );
  }

  /// Generates dynamic shadow based on background color
  List<BoxShadow> _getShadow(Color color) {
    if (color == ColorPalette.primary) {
      return [
        BoxShadow(
          color: const Color(0xFF10227B).withOpacity(0.2),
          offset: const Offset(0, 4),
          blurRadius: 12,
        ),
      ];
    } else {
      return [
        BoxShadow(
          color: const Color(0xFF04139C).withOpacity(0.2),
          offset: const Offset(0, 2),
          blurRadius: 4,
        ),
      ];
    }
  }

  /// Builds the primary button UI
  Widget _buildPrimary() {
    return Container(
      height: dHeight,
      width: dWidth,
      decoration: BoxDecoration(
        color: isDisabled ? ColorPalette.lightGrey : bgColor,
        borderRadius: BorderRadius.circular(dCornerRadius),
        border: isDisabled ? null : Border.all(color: borderColor, width: 1),
        // boxShadow: _getShadow(bgColor),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            isLoading
                ? const SizedBox(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(color: Colors.white),
                  )
                : Text(
                    strButtonText,
                    textAlign: buttonTextAlignment,
                    style: isDisabled
                        ? textStyle?.copyWith(
                            color: ColorPalette.darkestGrey,
                          )
                        : textStyle?.copyWith(
                            color: textColor,
                          ),
                  ),
            if (icon != null)
              Container(
                color: Colors.transparent,
                margin: const EdgeInsets.only(left: 10),
                child: buttonIcon!,
              ),
          ],
        ),
      ),
    );
  }

  /// Builds the secondary button UI
  Widget _buildSecondary() {
    return Container(
      height: dHeight,
      width: dWidth,
      decoration: BoxDecoration(
        color: isDisabled ? ColorPalette.lightGrey : bgColor,
        borderRadius: BorderRadius.circular(100.r),
        border: Border.all(
            color: isDisabled ? ColorPalette.lightGrey : borderColor, width: 1),
        boxShadow: isDisabled ? [] : _getShadow(bgColor),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            isLoading
                ? const SizedBox(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(color: Colors.black),
                  )
                : Text(
                    strButtonText,
                    textAlign: buttonTextAlignment,
                    style: isDisabled
                        ? textStyle?.copyWith(color: ColorPalette.darkestGrey)
                        : textStyle?.copyWith(color: textColor),
                  ),
            if (icon != null)
              Container(
                color: Colors.transparent,
                margin: const EdgeInsets.only(left: 10),
                child: buttonIcon!,
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isDisabled) {
      return buttonType == ButtonType.primary
          ? _buildPrimary()
          : _buildSecondary();
    }

    return BouncingWidget(
      duration: const Duration(milliseconds: 180),
      scaleFactor: 1.5,
      onPressed: () {
        if (!isLoading) {
          buttonAction();
        }
      },
      child: buttonType == ButtonType.primary
          ? _buildPrimary()
          : _buildSecondary(),
    );
  }
}
