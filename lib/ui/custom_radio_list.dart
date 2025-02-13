import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oru_mobiles/ui/custom_radio_list_tile.dart';

class CustomRadioList extends StatefulWidget {
  final Set<String> options;
  final String? groupValue;
  final Axis? direction;
  final Function(String) onChanged;

  const CustomRadioList({
    super.key,
    this.groupValue,
    required this.options,
    this.direction = Axis.vertical,
    required this.onChanged,
  });

  @override
  State<CustomRadioList> createState() => _CustomRadioListState();
}

class _CustomRadioListState extends State<CustomRadioList> {
  String groupValue = '';

  @override
  void initState() {
    groupValue = widget.groupValue ?? widget.options.elementAt(0);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CustomRadioList oldWidget) {
    setState(() {
      groupValue = widget.groupValue ?? widget.options.elementAt(2);
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return widget.direction == Axis.horizontal
        ? Row(children: _buildList())
        : Column(children: _buildList());
  }

  _buildList() {
    return List.generate(
      widget.options.length,
      (index) {
        return CustomRadioListTile(
          padding: widget.direction == Axis.horizontal
              ? null
              : EdgeInsets.symmetric(
                  vertical: 10.h,
                ),
          title: widget.options.elementAt(index),
          groupValue: groupValue == widget.options.elementAt(index),
          onTap: () {
            widget.onChanged(widget.options.elementAt(index));
            setState(() => groupValue = widget.options.elementAt(index));
          },
        );
      },
    );
  }
}
