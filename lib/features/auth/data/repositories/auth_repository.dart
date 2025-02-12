import 'package:dartz/dartz.dart';
import 'package:oru_mobiles/core/errors/failures.dart';
import 'package:oru_mobiles/core/network/network_info.dart';
import 'package:oru_mobiles/features/auth/data/data_sources/auth_remote_data_sources.dart';
import 'package:oru_mobiles/features/auth/domain/entities/generate_otp_entity.dart';

class AuthRepository {
  final NetworkInfo _networkInfo;
  final AuthRemoteDataSources _dataSources;

  AuthRepository({
    required NetworkInfo networkInfo,
    required AuthRemoteDataSources dataSources,
  })  : _networkInfo = networkInfo,
        _dataSources = dataSources;

  Future<Either<Failure, String>> genrateOTP(GenerateOtpEntity entity) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSources.genrateOTP(entity: entity);
        return Right(response);
      } catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(InternetFailure());
    }
  }
}
