import 'package:oru_mobiles/features/home/domain/entities/filter_entity.dart';

class FilterResponseModel {
  final String label;
  final List<String> options;

  FilterResponseModel({required this.label, required this.options});

  factory FilterResponseModel.fromJson(MapEntry<String, dynamic> json) {
    return FilterResponseModel(
      label: json.key,
      options: List<String>.from(json.value),
    );
  }

  static List<FilterResponseModel> fromMap(Map<String, dynamic> map) {
    return map.entries
        .map((entry) => FilterResponseModel.fromJson(entry))
        .toList();
  }

  Map<String, dynamic> toJson() {
    return {
      label: options,
    };
  }

  FilterEntity toFilterEntity({bool isSelected = false}) {
    return FilterEntity(
      label: label,
      isSelected: isSelected,
      selectedValues: 0,
      options:
          options.map((option) => FilterLabelEntity(label: option)).toList(),
    );
  }
}
