import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oru_mobiles/core/constants/color_palatte.dart';
import 'package:oru_mobiles/core/helpers/scaffold_helper.dart';
import 'package:oru_mobiles/features/auth/domain/entities/validate_otp_entity.dart';
import 'package:oru_mobiles/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:oru_mobiles/features/auth/presentation/utils/auth_validators.dart';
import 'package:oru_mobiles/features/auth/presentation/widgets/sign_up_widget.dart';
import 'package:oru_mobiles/features/auth/presentation/widgets/verification_text_widget.dart';
import 'package:oru_mobiles/injection_container/injection_container.dart';
import 'package:oru_mobiles/routes/app_routes.dart';
import 'package:oru_mobiles/routes/custom_navigator.dart';
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
  final String phoneNumber;
  const OtpWidget(
      {super.key,
      this.otpWidgetType = OtpWidgetType.pageWidget,
      required this.phoneNumber});

  @override
  State<OtpWidget> createState() => _OtpWidgetState();
}

class _OtpWidgetState extends State<OtpWidget> {
  var _formKey = GlobalKey<FormState>();
  late AuthBloc _bloc;
  late StreamController<int> _counterStream;
  late Timer _timer;
  int _counter = 30;
  late ValidateOtpEntity _entity;
  late StreamController<bool> _btnStream;
  void _startCounter() {
    _entity = ValidateOtpEntity(
      mobileNumber: widget.phoneNumber,
      countryCode: '91',
      otp: '',
    );
    _bloc = sl<AuthBloc>();
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
    _btnStream = StreamController<bool>.broadcast();
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
    return BlocConsumer<AuthBloc, AuthState>(
      bloc: _bloc,
      listener: (context, state) {
        if (state is ValidateOtpSuccessState) {
          ScaffoldHelper.showSnackBar(
            context: context,
            message: "OTP verified successfully",
            type: SnakBarType.success,
          );
          if (widget.otpWidgetType!.isPageWidget) {
            if (state.user.userName.isEmpty) {
              CustomNavigator.pushReplace(
                context,
                AppRouter.register,
              );
            }
          } else {
            Navigator.pop(context);
            ScaffoldHelper.showBottomSheet(
              context: context,
              child: const SignUpWidget(),
              title: 'Sign Up to continue',
            );
          }
        }

        if (state is AuthErrorState) {
          ScaffoldHelper.showSnackBar(
            context: context,
            message: state.message,
            type: SnakBarType.error,
          );
        }
      },
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!widget.otpWidgetType!.isPageWidget) ...[
              CustomSpacers.height10,
              VerificationTextWidget(
                phoneNumber: widget.phoneNumber,
              ),
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
                _buildTryAgainText(),
              ],
            ),
            if (widget.otpWidgetType!.isPageWidget) CustomSpacers.height100,
            if (!widget.otpWidgetType!.isPageWidget) CustomSpacers.height20,
            StreamBuilder<bool>(
              stream: _btnStream.stream,
              initialData: false,
              builder: (context, snapshot) {
                return CustomButton(
                  isDisabled: !snapshot.data!,
                  isLoading: state is AuthLoadingState,
                  strButtonText: 'Verfiy OTP',
                  buttonAction: () => _bloc.validateOtp(_entity),
                );
              },
            ),
          ],
        );
      },
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
                onCompleted: (pin) {
                  _btnStream.add(pin.length == 4);
                  _entity = _entity.copyWith(otp: pin);
                },
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
