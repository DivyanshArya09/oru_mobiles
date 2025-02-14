import 'package:flutter/material.dart';
import 'package:oru_mobiles/core/constants/color_palatte.dart';
import 'package:oru_mobiles/features/home/domain/entities/filter_entity.dart';
import 'package:oru_mobiles/ui/check_box_with_label.dart';
import 'package:oru_mobiles/utils/custom_spacers.dart';

class FilterCheckList extends StatelessWidget {
  final Function(int, bool) onChanged;
  final Function(bool value) onAllSelected;
  final bool? isAllSelected;
  final List<FilterLabelEntity> filterLabelEntity;
  final String label;
  final bool? isCondition;
  const FilterCheckList(
      {super.key,
      required this.label,
      required this.onChanged,
      required this.filterLabelEntity,
      this.isCondition = false,
      this.isAllSelected,
      required this.onAllSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSpacers.height10,
        CheckBoxWithLabel(
          value: isAllSelected,
          label: 'All $label',
          onChanged: (v) {
            onAllSelected(v ?? false);
          },
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: const Divider(
            thickness: 1,
            color: ColorPalette.borderColorLight,
          ),
        ),
        for (int i = 0; i < filterLabelEntity.length; i++) ...[
          Row(
            children: [
              CheckBoxWithLabel(
                value: filterLabelEntity[i].isSelected,
                label: filterLabelEntity[i].label,
                onChanged: (v) {
                  onChanged(i, v ?? false);
                },
              ),
              const Spacer(),
              if (isCondition == true)
                const Icon(
                  Icons.error_outline_outlined,
                  size: 16,
                  color: ColorPalette.lightGrey,
                ),
              CustomSpacers.width16,
            ],
          ),
        ],
      ],
    );
  }
}
