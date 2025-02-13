import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oru_mobiles/core/usecases/use_case.dart';
import 'package:oru_mobiles/features/home/data/models/faq_model.dart';
import 'package:oru_mobiles/features/home/data/models/mobile_brand_model.dart';
import 'package:oru_mobiles/features/home/domain/usecases/get_faqs_use_case.dart';
import 'package:oru_mobiles/features/home/domain/usecases/get_mobile_brands_use_case.dart';

part 'home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  final GetMobileBrandsUseCase _getMobileBrandsUseCase;
  final GetFaqsUseCase _getFaqsUseCase;

  HomeBloc(
      {required GetMobileBrandsUseCase getMobileBrandsUseCase,
      required GetFaqsUseCase getFaqsUseCase})
      : _getMobileBrandsUseCase = getMobileBrandsUseCase,
        _getFaqsUseCase = getFaqsUseCase,
        super(HomeInitial());

  List<MobileBrandModel> mobileBrands = [];
  List<FaqModel> faqs = [];

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

  Future<void> getFaqs() async {
    emit(GetFaqLoadingState());
    final result = await _getFaqsUseCase.call(NoParams());
    result.fold(
        (l) => emit(
              HomeErrorState(
                  message: l.message ?? 'Failed to get mobile brands'),
            ), (r) {
      faqs = r;
      emit(
        GetFaqSuccessState(faqs: r),
      );
    });
  }
}
