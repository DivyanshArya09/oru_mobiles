import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oru_mobiles/features/auth/domain/entities/generate_otp_entity.dart';
import 'package:oru_mobiles/features/auth/domain/usecases/generate_otp_use_case.dart';

part 'auth_state.dart';

class AuthBloc extends Cubit<AuthState> {
  final GenerateOtpUseCase _generateOtpUseCase;
  AuthBloc({
    required GenerateOtpUseCase generateOtpUseCase,
  })  : _generateOtpUseCase = generateOtpUseCase,
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
}
