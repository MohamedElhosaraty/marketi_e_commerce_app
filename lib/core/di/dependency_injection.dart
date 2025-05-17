import 'package:get_it/get_it.dart';
import 'package:marketi_e_commerce_app/features/auth/login/data/data_sources/sign_up_data-sources_impl.dart';
import 'package:marketi_e_commerce_app/features/auth/login/data/repositories/sign_up_repo_impl.dart';
import 'package:marketi_e_commerce_app/features/auth/login/domain/usecase/sign_up_usecase.dart';
import 'package:marketi_e_commerce_app/features/auth/login/presentation/cubit/sign_up_cubit/sign_up_cubit.dart';

import '../../features/auth/login/data/data_sources/login_data_sources_impl.dart';
import '../../features/auth/login/data/repositories/login_repo_impl.dart';
import '../../features/auth/login/domain/usecase/login_usecase.dart';
import '../../features/auth/login/presentation/cubit/login_cubit/login_cubit.dart';
import '../api/api_manager.dart';
import '../api/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerLazySingleton<ApiManager>(
    () => ApiManager(dio: DioFactory.getDio()),
  );

  // Data Sources
  getIt.registerLazySingleton<LoginRemoteDataSourceImpl>(() => LoginRemoteDataSourceImpl(getIt<ApiManager>()));
  getIt.registerLazySingleton<SignUpDataSourceImpl>(() => SignUpDataSourceImpl(getIt<ApiManager>()));

  // Repositories
  getIt.registerLazySingleton<LoginRepositoryImpl>(() => LoginRepositoryImpl(getIt<LoginRemoteDataSourceImpl>()));
  getIt.registerLazySingleton<SignUpRepoImpl>(() => SignUpRepoImpl(getIt<SignUpDataSourceImpl>()));


  // Use Cases
  getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCase(getIt<LoginRepositoryImpl>()));
  getIt.registerLazySingleton<SignUpUseCase>(() => SignUpUseCase(getIt<SignUpRepoImpl>()));


  // Cubits
  getIt.registerFactory(() => LoginCubit(getIt<LoginUseCase>()));
  getIt.registerFactory(() => SignUpCubit(getIt<SignUpUseCase>()));

}
