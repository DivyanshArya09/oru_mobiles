import 'package:flutter/material.dart';
import 'package:oru_mobiles/features/home/domain/entities/filter_entity.dart';
import 'package:oru_mobiles/ui/check_box_with_label.dart';

class FilterCheckList extends StatelessWidget {
  final Function(int, bool) onChanged;
  final List<FilterLabelEntity> filterLabelEntity;
  const FilterCheckList(
      {super.key, required this.onChanged, required this.filterLabelEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < filterLabelEntity.length; i++) ...[
          CheckBoxWithLabel(
            value: filterLabelEntity[i].isSelected,
            label: filterLabelEntity[i].label,
            onChanged: (v) {
              onChanged(i, v ?? false);
            },
          ),
        ],
      ],
    );
  }
}
