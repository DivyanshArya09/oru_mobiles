import 'dart:async';

import 'package:flutter/material.dart';
import 'package:oru_mobiles/core/constants/color_palatte.dart';
import 'package:oru_mobiles/features/auth/utils/auth_validators.dart';
import 'package:oru_mobiles/features/auth/widgets/verification_text_widget.dart';
import 'package:oru_mobiles/themes/app_text_themes.dart';
import 'package:oru_mobiles/themes/pin_put_themes.dart';
import 'package:oru_mobiles/ui/custom_button.dart';
import 'package:oru_mobiles/utils/custom_spacers.dart';
import 'package:pinput/pinput.dart';

enum OtpWidgetType { bottomSheet, pageWidget }

extension OtpWidgetTypeExtension on OtpWidgetType {
  bool get isPageWidget {
    return this == OtpWidgetType.pageWidget;
  }
}

class OtpWidget extends StatefulWidget {
  final OtpWidgetType? otpWidgetType;
  const OtpWidget({super.key, this.otpWidgetType = OtpWidgetType.pageWidget});

  @override
  State<OtpWidget> createState() => _OtpWidgetState();
}

class _OtpWidgetState extends State<OtpWidget> {
  var _formKey = GlobalKey<FormState>();

  late StreamController<int> _counterStream;
  late Timer _timer;
  int _counter = 30;
  void _startCounter() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _counter--;
      if (_counter <= 0) {
        _timer.cancel();
      }
      _counterStream.add(_counter);
    });
  }

  @override
  void initState() {
    _counterStream = StreamController<int>.broadcast();
    _startCounter();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    _counterStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!widget.otpWidgetType!.isPageWidget) ...[
          CustomSpacers.height10,
          VerificationTextWidget(),
          CustomSpacers.height10
        ],
        _buildOtpField(),
        CustomSpacers.height20,
        Text(
          'Didn’t receive OTP?',
          style: AppTextThemes.of(context).labelLarge?.copyWith(
                color: ColorPalette.lightGrey,
              ),
        ),
        CustomSpacers.height10,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Resend OTP',
              style: AppTextThemes.of(context).labelLarge?.copyWith(
                    color: ColorPalette.primary,
                    decoration: TextDecoration.underline,
                  ),
            ),
            // CustomSpacers.width10,
            _buildTryAgainText(),
          ],
        ),
        if (widget.otpWidgetType!.isPageWidget) CustomSpacers.height100,
        if (!widget.otpWidgetType!.isPageWidget) CustomSpacers.height20,
        CustomButton(
          strButtonText: 'Verfiy OTP',
          buttonAction: () {},
        ),
      ],
    );
  }

  Widget _buildTryAgainText() {
    return StreamBuilder<int>(
      initialData: 0,
      stream: _counterStream.stream,
      builder: (context, snapshot) {
        return Visibility(
          visible: snapshot.data != 0,
          child: Text(
            ' in 0:${snapshot.data} seconds',
            style: AppTextThemes.of(context).labelLarge,
          ),
        );
      },
    );
  }

  Widget _buildOtpField() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.5,
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Pinput(
                validator: AuthValidators.validateOTP,
                length: 4,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                defaultPinTheme: PinPutThemes.defaultPinTheme,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                onCompleted: (pin) => print(pin),
              ),
              CustomSpacers.height10,
              // _buildTryAgainText(),
            ],
          ),
        ),
      ),
    );
  }
}
