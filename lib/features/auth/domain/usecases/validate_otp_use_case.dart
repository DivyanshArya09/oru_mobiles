import 'package:dartz/dartz.dart';
import 'package:oru_mobiles/core/errors/failures.dart';
import 'package:oru_mobiles/core/usecases/use_case.dart';
import 'package:oru_mobiles/features/auth/data/models/user_model.dart';
import 'package:oru_mobiles/features/auth/data/repositories/auth_repository.dart';
import 'package:oru_mobiles/features/auth/domain/entities/validate_otp_entity.dart';

class ValidateOtpUseCase extends UseCase<UserModel, ValidateOtpEntity> {
  final AuthRepository authRepository;

  ValidateOtpUseCase({required this.authRepository});
  @override
  Future<Either<Failure, UserModel>> call(ValidateOtpEntity entity) {
    return authRepository.validateOtp(entity);
  }
}
