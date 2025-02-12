import 'package:dartz/dartz.dart';
import 'package:oru_mobiles/core/errors/exceptions.dart';
import 'package:oru_mobiles/core/errors/failures.dart';
import 'package:oru_mobiles/core/network/network_info.dart';
import 'package:oru_mobiles/features/home/data/data_sources/home_remote_data_sources.dart';
import 'package:oru_mobiles/features/home/data/models/mobile_brand_model.dart';

class HomeRepository {
  final NetworkInfo _networkInfo;
  final HomeRemoteDataSources _dataSources;

  HomeRepository({
    required NetworkInfo networkInfo,
    required HomeRemoteDataSources dataSources,
  })  : _networkInfo = networkInfo,
        _dataSources = dataSources;

  Future<Either<Failure, List<MobileBrandModel>>> getBrands() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSources.getBrands();
        return Right(response);
      } catch (e) {
        if (e is ApiException) {
          return Left(ServerFailure(message: e.message));
        }
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(InternetFailure());
    }
  }
}
