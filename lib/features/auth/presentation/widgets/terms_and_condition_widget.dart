import 'package:flutter/material.dart';
import 'package:oru_mobiles/core/constants/color_palatte.dart';
import 'package:oru_mobiles/themes/app_text_themes.dart';
import 'package:oru_mobiles/utils/custom_spacers.dart';

class TermsAndConditionWidget extends StatefulWidget {
  final Function(bool) onChanged;
  const TermsAndConditionWidget({super.key, required this.onChanged});

  @override
  State<TermsAndConditionWidget> createState() =>
      _TermsAndConditionWidgetState();
}

class _TermsAndConditionWidgetState extends State<TermsAndConditionWidget> {
  bool _isChecked = false;

  @override
  void initState() {
    widget.onChanged(_isChecked);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: _isChecked,
          onChanged: (v) {
            setState(
              () {
                _isChecked = !_isChecked;
                widget.onChanged(_isChecked);
              },
            );
          },
        ),
        CustomSpacers.width16,
        Text(
          'Accept ',
          style: AppTextThemes.of(context).bodyLarge,
        ),
        Text(
          'Terms and condition',
          style: AppTextThemes.of(context).bodyLarge?.copyWith(
                decoration: TextDecoration.underline,
                color: ColorPalette.primary,
              ),
        )
      ],
    );
  }
}
