import 'package:dartz/dartz.dart';
import 'package:oru_mobiles/core/errors/failures.dart';
import 'package:oru_mobiles/core/usecases/use_case.dart';
import 'package:oru_mobiles/features/auth/data/repositories/auth_repository.dart';
import 'package:oru_mobiles/features/auth/domain/entities/generate_otp_entity.dart';

class GenerateOtpUseCase extends UseCase<String, GenerateOtpEntity> {
  final AuthRepository authRepository;

  GenerateOtpUseCase({required this.authRepository});
  @override
  Future<Either<Failure, String>> call(GenerateOtpEntity entity) {
    return authRepository.genrateOTP(entity);
  }
}
