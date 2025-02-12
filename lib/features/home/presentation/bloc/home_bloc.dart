import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oru_mobiles/core/usecases/use_case.dart';
import 'package:oru_mobiles/features/home/data/models/mobile_brand_model.dart';
import 'package:oru_mobiles/features/home/domain/usecases/get_mobile_brands_use_case.dart';

part 'home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  final GetMobileBrandsUseCase _getMobileBrandsUseCase;
  HomeBloc({
    required GetMobileBrandsUseCase getMobileBrandsUseCase,
  })  : _getMobileBrandsUseCase = getMobileBrandsUseCase,
        super(HomeInitial());

  List<MobileBrandModel> mobileBrands = [];

  Future<void> getMobileBrands() async {
    emit(HomeLoadingState());
    final result = await _getMobileBrandsUseCase.call(NoParams());
    result.fold(
        (l) => emit(
              HomeErrorState(
                  message: l.message ?? 'Failed to get mobile brands'),
            ), (r) {
      mobileBrands = r;
      emit(
        HomeLoadedState(mobileBrands: r),
      );
    });
  }
}
