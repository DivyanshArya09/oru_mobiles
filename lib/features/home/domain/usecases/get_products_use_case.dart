import 'package:dartz/dartz.dart';
import 'package:oru_mobiles/core/errors/failures.dart';
import 'package:oru_mobiles/core/usecases/use_case.dart';
import 'package:oru_mobiles/features/home/data/models/product_model.dart';
import 'package:oru_mobiles/features/home/data/repository/home_repositiry.dart';
import 'package:oru_mobiles/features/home/domain/entities/get_products_filter_entity.dart';

class GetProductsUseCase
    extends UseCase<List<ProductModel>, GetProductsFilterEntity> {
  final HomeRepository homeRepository;

  GetProductsUseCase({required this.homeRepository});
  @override
  Future<Either<Failure, List<ProductModel>>> call(
      GetProductsFilterEntity entity) {
    return homeRepository.getProducts(entity: entity);
  }
}
