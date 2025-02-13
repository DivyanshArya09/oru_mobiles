import 'package:flutter/material.dart';
import 'package:oru_mobiles/core/constants/color_palatte.dart';
import 'package:oru_mobiles/themes/app_text_themes.dart';

class CheckBoxWithLabel extends StatefulWidget {
  final String label;
  final Function(bool?) onChanged;
  final bool? value;
  const CheckBoxWithLabel(
      {super.key, required this.label, required this.onChanged, this.value});

  @override
  State<CheckBoxWithLabel> createState() => _CheckBoxWithLabelState();
}

class _CheckBoxWithLabelState extends State<CheckBoxWithLabel> {
  bool isChecked = false;

  @override
  void initState() {
    isChecked = widget.value ?? false;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CheckBoxWithLabel oldWidget) {
    setState(() {
      isChecked = widget.value ?? false;
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          checkColor: ColorPalette.white,
          value: isChecked,
          activeColor: Colors.black,
          onChanged: (v) {
            setState(() {
              isChecked = !isChecked;
              widget.onChanged(isChecked);
            });
          },
        ),
        Text(
          widget.label,
          style: AppTextThemes.of(context).bodyMedium?.copyWith(
                color: ColorPalette.darkestGrey,
              ),
        ),
      ],
    );
  }
}
