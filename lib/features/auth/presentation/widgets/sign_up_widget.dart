import 'package:flutter/material.dart';
import 'package:oru_mobiles/ui/custom_button.dart';
import 'package:oru_mobiles/ui/custom_text_field.dart';
import 'package:oru_mobiles/utils/custom_spacers.dart';

enum SignUpWidgetType { bottomSheet, pageWidget }

extension SignUpWidgetTypeExtension on SignUpWidgetType {
  bool get isPageWidget {
    return this == SignUpWidgetType.pageWidget;
  }
}

class SignUpWidget extends StatefulWidget {
  final SignUpWidgetType? signUpWidgetType;
  const SignUpWidget(
      {super.key, this.signUpWidgetType = SignUpWidgetType.pageWidget});

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  late TextEditingController _nameTC;

  @override
  void initState() {
    _nameTC = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameTC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.signUpWidgetType!.isPageWidget) CustomSpacers.height100,
        if (!widget.signUpWidgetType!.isPageWidget) CustomSpacers.height10,
        CustomTextField(
          controller: _nameTC,
          title: 'Please Tell Us Your Name *',
          hintText: 'Name',
        ),
        if (widget.signUpWidgetType!.isPageWidget) CustomSpacers.height100,
        if (!widget.signUpWidgetType!.isPageWidget) CustomSpacers.height32,
        CustomButton.icon(
          strButtonText: 'Confirm Name',
          buttonAction: () {},
          icon: const Icon(Icons.arrow_forward, color: Colors.white),
        ),
      ],
    );
  }
}
