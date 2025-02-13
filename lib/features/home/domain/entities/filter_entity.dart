class FilterEntity {
  final String label;
  final bool isSelected;
  int selectedValues;
  final List<FilterLabelEntity> options;

  FilterEntity({
    required this.label,
    required this.isSelected,
    required this.selectedValues,
    required this.options,
  });

  factory FilterEntity.toEmpty() {
    return FilterEntity(
      label: '',
      isSelected: false,
      selectedValues: 0,
      options: [],
    );
  }

  FilterEntity reset() {
    return FilterEntity(
      label: label,
      isSelected: false,
      selectedValues: 0,
      options: options.map((e) => e.copyWith(isSelected: false)).toList(),
    );
  }

  FilterEntity copyWith({
    String? label,
    bool? isSelected,
    int? selectedValues,
    List<FilterLabelEntity>? options,
  }) {
    return FilterEntity(
      label: label ?? this.label,
      isSelected: isSelected ?? this.isSelected,
      selectedValues: selectedValues ?? this.selectedValues,
      options: options ?? this.options,
    );
  }
}

class FilterLabelEntity {
  final String label;
  final bool? isSelected;

  FilterLabelEntity({
    required this.label,
    this.isSelected = false,
  });

  FilterLabelEntity copyWith({
    String? label,
    bool? isSelected,
  }) {
    return FilterLabelEntity(
      label: label ?? this.label,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
