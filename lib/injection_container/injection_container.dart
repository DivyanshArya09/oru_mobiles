import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:oru_mobiles/core/network/network_info.dart';
import 'package:oru_mobiles/features/auth/data/data_sources/auth_remote_data_sources.dart';
import 'package:oru_mobiles/features/auth/data/repositories/auth_repository.dart';
import 'package:oru_mobiles/features/auth/domain/usecases/generate_otp_use_case.dart';
import 'package:oru_mobiles/features/auth/domain/usecases/validate_otp_use_case.dart';
import 'package:oru_mobiles/features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  general();
  auth();
}

void auth() {
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepository(
      dataSources: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => AuthRemoteDataSources(),
  );
  sl.registerLazySingleton(
    () => GenerateOtpUseCase(
      authRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => ValidateOtpUseCase(
      authRepository: sl(),
    ),
  );
  sl.registerFactory(
    () => AuthBloc(
      generateOtpUseCase: sl(),
      validateOtpUseCase: sl(),
    ),
  );
}

void general() {
  sl.registerLazySingleton(() => InternetConnectionChecker.createInstance());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
}
