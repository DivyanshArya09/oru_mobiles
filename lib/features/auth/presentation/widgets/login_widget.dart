import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oru_mobiles/core/constants/color_palatte.dart';
import 'package:oru_mobiles/core/helpers/scaffold_helper.dart';
import 'package:oru_mobiles/features/auth/domain/entities/generate_otp_entity.dart';
import 'package:oru_mobiles/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:oru_mobiles/features/auth/presentation/utils/auth_validators.dart';
import 'package:oru_mobiles/features/auth/presentation/widgets/otp_widget.dart';
import 'package:oru_mobiles/features/auth/presentation/widgets/terms_and_condition_widget.dart';
import 'package:oru_mobiles/injection_container/injection_container.dart';
import 'package:oru_mobiles/routes/app_routes.dart';
import 'package:oru_mobiles/routes/custom_navigator.dart';
import 'package:oru_mobiles/themes/app_text_themes.dart';
import 'package:oru_mobiles/ui/custom_button.dart';
import 'package:oru_mobiles/ui/custom_text_field.dart';
import 'package:oru_mobiles/utils/custom_spacers.dart';

enum LoginWidgetType { bottomSheet, pageWidget }

extension LoginWidgetTypeExtension on LoginWidgetType {
  bool get isPageWidget {
    return this == LoginWidgetType.pageWidget;
  }
}

class LoginWidget extends StatefulWidget {
  final LoginWidgetType? loginWidgetType;
  const LoginWidget(
      {super.key, this.loginWidgetType = LoginWidgetType.pageWidget});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late TextEditingController _phoneTC;
  late StreamController<bool> _btnStream;
  late AuthBloc _bloc;
  bool isConditionChecked = false;
  var _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _phoneTC = TextEditingController();
    _btnStream = StreamController<bool>.broadcast();
    _bloc = sl<AuthBloc>();
    super.initState();
  }

  @override
  void dispose() {
    _phoneTC.dispose();
    _btnStream.close();
    _bloc.close();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  void _btnStreamChanged() =>
      _btnStream.add(isConditionChecked && _phoneTC.text.length == 10);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      bloc: _bloc,
      listener: (context, state) {
        if (state is AuthSuccessState) {
          ScaffoldHelper.showSnackBar(
            context: context,
            message: state.message!,
            type: SnakBarType.success,
          );
          if (widget.loginWidgetType!.isPageWidget) {
            CustomNavigator.pushTo(
              context,
              AppRouter.otp,
              arguments: _phoneTC.text,
            );
          } else {
            Navigator.pop(context);
            ScaffoldHelper.showBottomSheet(
              context: context,
              child: OtpWidget(
                phoneNumber: _phoneTC.text,
                otpWidgetType: OtpWidgetType.bottomSheet,
              ),
              title: 'Verify OTP',
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
        return Form(
          key: _formKey,
          child: Container(
            color: ColorPalette.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextField(
                  validator: AuthValidators.validatePhoneNumber,
                  maxLength: 10,
                  onChanged: (v) {
                    _btnStreamChanged();
                  },
                  keyboardType: TextInputType.phone,
                  controller: _phoneTC,
                  title: 'Enter Your Phone Number',
                  hintText: 'Mobile Number',
                  prefix: Text(
                    '+91',
                    style: AppTextThemes.of(context)
                        .bodyMedium
                        ?.copyWith(color: ColorPalette.darktext),
                  ),
                ),
                if (!widget.loginWidgetType!.isPageWidget)
                  CustomSpacers.height16,
                if (widget.loginWidgetType!.isPageWidget)
                  CustomSpacers.height120,
                TermsAndConditionWidget(
                  onChanged: (v) {
                    isConditionChecked = v;
                    _btnStreamChanged();
                  },
                ),
                CustomSpacers.height16,
                _buildButton(state),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildButton(AuthState state) {
    return StreamBuilder<bool>(
        initialData: false,
        stream: _btnStream.stream,
        builder: (context, snapshot) {
          return CustomButton.icon(
            isDisabled: snapshot.data != true,
            isLoading: state is AuthLoadingState,
            buttonAction: () {
              if (_formKey.currentState!.validate()) {
                _bloc.generateOtp(
                  GenerateOtpEntity(
                    mobileNumber: _phoneTC.text,
                    countryCode: '91',
                  ),
                );
              }
            },
            strButtonText: 'Next',
            icon: const Icon(
              Icons.arrow_forward,
              color: ColorPalette.white,
            ),
          );
        });
  }
}
