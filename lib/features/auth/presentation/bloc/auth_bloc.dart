import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oru_mobiles/features/auth/data/models/user_model.dart';
import 'package:oru_mobiles/features/auth/domain/entities/generate_otp_entity.dart';
import 'package:oru_mobiles/features/auth/domain/entities/validate_otp_entity.dart';
import 'package:oru_mobiles/features/auth/domain/usecases/generate_otp_use_case.dart';
import 'package:oru_mobiles/features/auth/domain/usecases/validate_otp_use_case.dart';

part 'auth_state.dart';

class AuthBloc extends Cubit<AuthState> {
  final GenerateOtpUseCase _generateOtpUseCase;
  final ValidateOtpUseCase _validateOtpUseCase;
  AuthBloc({
    required GenerateOtpUseCase generateOtpUseCase,
    required ValidateOtpUseCase validateOtpUseCase,
  })  : _generateOtpUseCase = generateOtpUseCase,
        _validateOtpUseCase = validateOtpUseCase,
        super(AuthInitial());

  Future<void> generateOtp(GenerateOtpEntity entity) async {
    emit(AuthLoadingState());
    final result = await _generateOtpUseCase.call(entity);
    result.fold(
      (l) => emit(
        AuthErrorState(
          message: l.message ?? 'Failed to generate OTP, Please try again!!',
        ),
      ),
      (r) => emit(
        AuthSuccessState(message: r),
      ),
    );
  }

  Future<void> validateOtp(ValidateOtpEntity entity) async {
    emit(AuthLoadingState());
    final result = await _validateOtpUseCase.call(entity);
    result.fold(
      (l) => emit(
        AuthErrorState(
          message: l.message ?? 'Failed to generate OTP, Please try again!!',
        ),
      ),
      (r) => emit(
        ValidateOtpSuccessState(user: r),
      ),
    );
  }
}
