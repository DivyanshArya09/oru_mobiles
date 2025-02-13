import 'package:dartz/dartz.dart';
import 'package:oru_mobiles/core/errors/failures.dart';
import 'package:oru_mobiles/core/usecases/use_case.dart';
import 'package:oru_mobiles/features/home/data/models/filter_response_model.dart';
import 'package:oru_mobiles/features/home/data/repository/home_repositiry.dart';

class GetFiltersUseCase extends UseCase<List<FilterResponseModel>, NoParams> {
  final HomeRepository homeRepository;

  GetFiltersUseCase({required this.homeRepository});
  @override
  Future<Either<Failure, List<FilterResponseModel>>> call(NoParams entity) {
    return homeRepository.getFilters();
  }
}
