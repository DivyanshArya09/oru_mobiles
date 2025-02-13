import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:oru_mobiles/core/network/network_info.dart';
import 'package:oru_mobiles/features/auth/data/data_sources/auth_remote_data_sources.dart';
import 'package:oru_mobiles/features/auth/data/repositories/auth_repository.dart';
import 'package:oru_mobiles/features/auth/domain/usecases/generate_otp_use_case.dart';
import 'package:oru_mobiles/features/auth/domain/usecases/validate_otp_use_case.dart';
import 'package:oru_mobiles/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:oru_mobiles/features/home/data/data_sources/home_remote_data_sources.dart';
import 'package:oru_mobiles/features/home/data/repository/home_repositiry.dart';
import 'package:oru_mobiles/features/home/domain/usecases/get_faqs_use_case.dart';
import 'package:oru_mobiles/features/home/domain/usecases/get_filters_use_case.dart';
import 'package:oru_mobiles/features/home/domain/usecases/get_mobile_brands_use_case.dart';
import 'package:oru_mobiles/features/home/domain/usecases/get_products_use_case.dart';
import 'package:oru_mobiles/features/home/presentation/blocs/filter_bloc/filter_bloc.dart';
import 'package:oru_mobiles/features/home/presentation/blocs/home_bloc/home_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  general();
  auth();
  home();
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

void home() {
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepository(
      dataSources: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => HomeRemoteDataSources(),
  );
  sl.registerLazySingleton(
    () => GetMobileBrandsUseCase(
      homeRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => GetFaqsUseCase(
      homeRepository: sl(),
    ),
  );

  sl.registerFactory(
    () => HomeBloc(
      getFaqsUseCase: sl(),
      getMobileBrandsUseCase: sl(),
    ),
  );

  //! filters
  sl.registerLazySingleton(
    () => GetFiltersUseCase(
      homeRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => GetProductsUseCase(
      homeRepository: sl(),
    ),
  );
  sl.registerFactory(
    () => FilterBloc(
      getProductsUseCase: sl(),
      getFiltersUseCase: sl(),
    ),
  );
}

void general() {
  sl.registerLazySingleton(() => InternetConnectionChecker.createInstance());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
}
