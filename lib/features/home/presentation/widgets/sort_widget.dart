import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oru_mobiles/features/home/presentation/widgets/bottom_sheet_bottom_container.dart';
import 'package:oru_mobiles/features/home/presentation/widgets/bottom_sheet_header.dart';
import 'package:oru_mobiles/features/home/utils/enums.dart';
import 'package:oru_mobiles/ui/custom_radio_list.dart';

class SortWidget extends StatefulWidget {
  final SortingType selectedSortingType;
  final Function(SortingType? value) onFilterChanged;
  final VoidCallback onApplyFilter, onClearFilter;
  const SortWidget(
      {super.key,
      required this.onFilterChanged,
      required this.onApplyFilter,
      required this.onClearFilter,
      required this.selectedSortingType});

  @override
  State<SortWidget> createState() => _SortWidgetState();
}

class _SortWidgetState extends State<SortWidget> {
  late StreamController<bool> _streamController;

  @override
  void initState() {
    _streamController = StreamController<bool>.broadcast();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .8,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Stack(
        children: [
          BottomSheetHeader(
            title: 'Sort',
            onClose: () {
              Navigator.pop(context);
            },
          ),
          _buildBody(),
          StreamBuilder<bool>(
              initialData: true,
              stream: _streamController.stream,
              builder: (context, snapshot) {
                return BottomSheetBottomContiner(
                  isDisabled: snapshot.data,
                  onClearFilter: widget.onClearFilter,
                  onApplyFilter: widget.onApplyFilter,
                );
              }),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Positioned(
      top: 64.h,
      bottom: 64.h,
      left: 0,
      right: 0,
      child: SingleChildScrollView(
        child: CustomRadioList(
          groupValue: widget.selectedSortingType.label,
          direction: Axis.vertical,
          options: SortingType.values.map((e) => e.label).toSet(),
          onChanged: (v) {
            _streamController.add(widget.selectedSortingType.label == v);
            widget.onFilterChanged(v.toSortingType);
          },
        ),
      ),
    );
  }
}
