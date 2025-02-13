import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oru_mobiles/core/usecases/use_case.dart';
import 'package:oru_mobiles/features/home/data/models/filter_response_model.dart';
import 'package:oru_mobiles/features/home/domain/entities/filter_entity.dart';
import 'package:oru_mobiles/features/home/domain/usecases/get_filters_use_case.dart';

part 'filter_state.dart';

class FilterBloc extends Cubit<FilterState> {
  final GetFiltersUseCase _getFiltersUseCase;
  FilterBloc({
    required GetFiltersUseCase getFiltersUseCase,
  })  : _getFiltersUseCase = getFiltersUseCase,
        super(FilterInitial());

  List<FilterEntity> filters = [];

  int parentIndex = 0;

  void parentLabelChanged(int index) {
    emit(Trying());
    for (int i = 0; i < filters.length; i++) {
      if (i == index) {
        filters[i] = filters[i].copyWith(isSelected: true);
      } else {
        filters[i] = filters[i].copyWith(isSelected: false);
      }
    }
    parentIndex = index;
    emit(Success());
  }

  void childLabelChanged(int parentIndex, int childIndex, bool isSelected) {
    emit(Trying());
    filters[parentIndex].options[childIndex] = filters[parentIndex]
        .options[childIndex]
        .copyWith(
            isSelected: !filters[parentIndex].options[childIndex].isSelected!);

    if (filters[parentIndex].options[childIndex].isSelected == true) {
      filters[parentIndex] = filters[parentIndex].copyWith(
        selectedValues: filters[parentIndex].selectedValues + 1,
      );
    } else {
      filters[parentIndex] = filters[parentIndex].copyWith(
        selectedValues: filters[parentIndex].selectedValues - 1,
      );
    }
    emit(Success());
  }

  void resetFilters() {
    emit(Trying());
    for (int i = 0; i < filters.length; i++) {
      filters[i] = filters[i].reset();
    }
    filters[0] = filters[0].copyWith(isSelected: true);
    parentIndex = 0;
    emit(Success());
  }

  Future<void> getFilters() async {
    emit(FilterLoading());
    final result = await _getFiltersUseCase(NoParams());
    result.fold((failure) {
      emit(
        FilterError(
          message: failure.message ?? 'Failed to get filters',
        ),
      );
    }, (res) {
      filters = res.map((e) => e.toFilterEntity()).toList();
      filters[0] = filters[0].copyWith(isSelected: true);
      emit(FilterLoaded(filters: res));
    });
  }
}
