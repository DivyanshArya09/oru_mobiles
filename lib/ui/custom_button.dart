import 'package:flutter/material.dart';
import 'package:oru_mobiles/core/constants/color_palatte.dart';
// import 'package:oru_mobiles/core/constants/color_palatte.dart';
import 'package:oru_mobiles/core/constants/figma_constants.dart';
import 'package:oru_mobiles/ui/molecules/bouncing_widget.dart';

class CustomButton extends StatelessWidget {
  final String strButtonText;
  final bool isDisabled;
  final VoidCallback buttonAction;
  final double dCornerRadius;
  final bool isLoading;
  final double dHeight;
  final Color borderColor;
  final Color bgColor;
  final Color textColor;
  final TextAlign buttonTextAlignment;
  final Widget? buttonIcon;
  final MainAxisAlignment mainAxisAlignment;
  final TextStyle? textStyle;
  final Icon? icon;

  const CustomButton(
      {Key? key,
      required this.strButtonText,
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
        // height: 27,
        color: ColorPalette.white,
      ),
      this.icon,
      this.mainAxisAlignment = MainAxisAlignment.spaceAround})
      : super(key: key);

  factory CustomButton.icon({
    required String strButtonText,
    required VoidCallback buttonAction,
    Color borderColor = ColorPalette.lightGrey,
    required Icon icon,
    Color bgColor = ColorPalette.primary,
    double? borderRaduis = BUTTON_BORDER_RADIUS,
  }) {
    return CustomButton(
      strButtonText: strButtonText,
      buttonAction: buttonAction,
      buttonIcon: icon,
      icon: icon,
      bgColor: bgColor,
      dCornerRadius: borderRaduis!,
      borderColor: borderColor,
    );
  }

  Widget _buildPrimary() {
    return Container(
      height: dHeight,
      decoration: BoxDecoration(
        color: isDisabled ? bgColor.withOpacity(.3) : bgColor,
        borderRadius: BorderRadius.circular(dCornerRadius),
        border: isDisabled ? null : Border.all(color: borderColor, width: 1),
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
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : Text(
                    strButtonText,
                    textAlign: buttonTextAlignment,
                    style: isDisabled
                        ? textStyle?.copyWith(
                            color: ColorPalette.white.withOpacity(.4),
                          )
                        : textStyle,
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
    return BouncingWidget(
      duration: const Duration(milliseconds: 180),
      scaleFactor: 1.5,
      onPressed: () {
        if (!isLoading) {
          buttonAction();
        }
      },
      child: _buildPrimary(),
    );
  }
}
