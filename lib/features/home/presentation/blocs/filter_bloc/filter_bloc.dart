import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oru_mobiles/core/usecases/use_case.dart';
import 'package:oru_mobiles/features/home/data/models/filter_response_model.dart';
import 'package:oru_mobiles/features/home/data/models/product_model.dart';
import 'package:oru_mobiles/features/home/domain/entities/filter_entity.dart';
import 'package:oru_mobiles/features/home/domain/entities/get_products_filter_entity.dart';
import 'package:oru_mobiles/features/home/domain/usecases/get_filters_use_case.dart';
import 'package:oru_mobiles/features/home/domain/usecases/get_products_use_case.dart';
import 'package:oru_mobiles/features/home/utils/enums.dart';

part 'filter_state.dart';

class FilterBloc extends Cubit<FilterState> {
  final GetFiltersUseCase _getFiltersUseCase;
  final GetProductsUseCase _getProductsUseCase;
  FilterBloc(
      {required GetFiltersUseCase getFiltersUseCase,
      required GetProductsUseCase getProductsUseCase})
      : _getFiltersUseCase = getFiltersUseCase,
        _getProductsUseCase = getProductsUseCase,
        super(FilterInitial());

  bool get isProductsState =>
      state is ProductsLoaded ||
      state is ProductsError ||
      state is ProductsLoading;

  List<FilterEntity> filters = [];

  SortingType? selectedSortingType;

  int parentIndex = 0;

  GetProductsFilterEntity _entity = GetProductsFilterEntity.toDefault();

  Future<void> applyFilters() async {
    _entity = GetProductsFilterEntity(
      filters: filters,
      sortingType: selectedSortingType,
    );
    getProducts();
  }

  Future<void> selectSortingType(SortingType type) async {
    selectedSortingType = type;
  }

  Future<void> getProducts() async {
    emit(ProductsLoading());
    final result = await _getProductsUseCase(_entity);
    result.fold((failure) {
      emit(
        ProductsError(
          message: failure.message ?? 'Failed to get products',
        ),
      );
    }, (res) {
      emit(ProductsLoaded(products: res));
    });
  }

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

  void selectAllChild(bool isSelected) {
    emit(Trying());
    filters[parentIndex] = filters[parentIndex].copyWith(
      isAllSelected: isSelected,
    );
    filters[parentIndex].options = filters[parentIndex]
        .options
        .map((e) => e.copyWith(isSelected: isSelected))
        .toList();
    if (isSelected) {
      filters[parentIndex] = filters[parentIndex]
          .copyWith(selectedValues: filters[parentIndex].options.length);
    } else {
      filters[parentIndex] = filters[parentIndex].copyWith(selectedValues: 0);
    }
    emit(Success());
  }

  void childLabelChanged(int parentIndex, int childIndex, bool isSelected) {
    emit(Trying());
    if (isSelected == false) {
      filters[parentIndex] = filters[parentIndex].copyWith(
        isAllSelected: false,
      );
    }

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

  void resetSortingType() {
    selectedSortingType = null;

    _entity = GetProductsFilterEntity(filters: filters);

    getProducts();
  }

  void resetFilters({bool isReset = false}) {
    emit(Trying());
    for (int i = 0; i < filters.length; i++) {
      filters[i] = filters[i].reset();
    }
    filters[0] = filters[0].copyWith(isSelected: true);
    parentIndex = 0;
    emit(Success());
    _entity = GetProductsFilterEntity.toDefault();
    if (isReset) {
      getProducts();
    }
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
