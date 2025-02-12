import 'package:dartz/dartz.dart';
import 'package:oru_mobiles/core/errors/failures.dart';
import 'package:oru_mobiles/core/usecases/use_case.dart';
import 'package:oru_mobiles/features/home/data/models/mobile_brand_model.dart';
import 'package:oru_mobiles/features/home/data/repository/home_repositiry.dart';

class GetMobileBrandsUseCase extends UseCase<List<MobileBrandModel>, NoParams> {
  final HomeRepository homeRepository;

  GetMobileBrandsUseCase({required this.homeRepository});
  @override
  Future<Either<Failure, List<MobileBrandModel>>> call(NoParams entity) {
    return homeRepository.getBrands();
  }
}
