import 'package:get_it/get_it.dart';
import 'package:marketi_e_commerce_app/features/auth/data/data_sources/create_new_password_data_sources.dart';
import 'package:marketi_e_commerce_app/features/auth/data/data_sources/create_new_password_data_sources_impl.dart';
import 'package:marketi_e_commerce_app/features/auth/data/data_sources/login_data_sources_impl.dart';
import 'package:marketi_e_commerce_app/features/auth/data/data_sources/send_pass_email_data_sources.dart';
import 'package:marketi_e_commerce_app/features/auth/data/data_sources/send_pass_email_data_sources_impl.dart';
import 'package:marketi_e_commerce_app/features/auth/data/data_sources/sign_up_data_sources.dart';
import 'package:marketi_e_commerce_app/features/auth/data/data_sources/verify_code_data_sources.dart';
import 'package:marketi_e_commerce_app/features/auth/data/data_sources/verify_code_data_sources_impl.dart';
import 'package:marketi_e_commerce_app/features/auth/data/data_sources/sign_up_data_sources_impl.dart';
import 'package:marketi_e_commerce_app/features/auth/data/repositories/create_new_password_repo_impl.dart';
import 'package:marketi_e_commerce_app/features/auth/data/repositories/login_repo_impl.dart';
import 'package:marketi_e_commerce_app/features/auth/data/repositories/sign_up_repo_impl.dart';
import 'package:marketi_e_commerce_app/features/auth/data/repositories/send_pass_email_repo_impl.dart';
import 'package:marketi_e_commerce_app/features/auth/data/repositories/verify_code_repo_impl.dart';
import 'package:marketi_e_commerce_app/features/auth/domain/repositories/create_new_password_repo.dart';
import 'package:marketi_e_commerce_app/features/auth/domain/repositories/login_repo.dart';
import 'package:marketi_e_commerce_app/features/auth/domain/repositories/sign_up_repo.dart';
import 'package:marketi_e_commerce_app/features/auth/domain/repositories/send_pass_email_repo.dart';
import 'package:marketi_e_commerce_app/features/auth/domain/repositories/verify_code_repo.dart';
import 'package:marketi_e_commerce_app/features/auth/domain/usecase/create_new_paassword_usecase.dart';
import 'package:marketi_e_commerce_app/features/auth/domain/usecase/login_usecase.dart';
import 'package:marketi_e_commerce_app/features/auth/domain/usecase/sign_up_usecase.dart';
import 'package:marketi_e_commerce_app/features/auth/domain/usecase/send_pass_email_usecase.dart';
import 'package:marketi_e_commerce_app/features/auth/domain/usecase/verify_code_usecase.dart';
import 'package:marketi_e_commerce_app/features/auth/presentation/cubit/create_new_password/create_new_password_cubit.dart';
import 'package:marketi_e_commerce_app/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:marketi_e_commerce_app/features/auth/presentation/cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:marketi_e_commerce_app/features/auth/presentation/cubit/send_pass_email_cubit/send_pass_email_cubit.dart';
import 'package:marketi_e_commerce_app/features/auth/presentation/cubit/verify_code_cubit/verify_code_cubit.dart';
import 'package:marketi_e_commerce_app/features/favourites/data/data_sources/favourites_data_sources.dart';
import 'package:marketi_e_commerce_app/features/favourites/data/data_sources/favourites_data_sources_impl.dart';
import 'package:marketi_e_commerce_app/features/favourites/data/repositories/favourites_repo_impl.dart';
import 'package:marketi_e_commerce_app/features/favourites/domain/repositories/favourites_repo.dart';
import 'package:marketi_e_commerce_app/features/home/data/data_sources/brand_data_sources.dart';
import 'package:marketi_e_commerce_app/features/home/data/data_sources/brand_data_sources_impl.dart';
import 'package:marketi_e_commerce_app/features/home/data/data_sources/category_data_sources.dart';
import 'package:marketi_e_commerce_app/features/home/data/data_sources/category_data_sources_impl.dart';
import 'package:marketi_e_commerce_app/features/home/data/data_sources/product_data_sources.dart';
import 'package:marketi_e_commerce_app/features/home/data/data_sources/product_data_sources_impl.dart';
import 'package:marketi_e_commerce_app/features/home/data/data_sources/user_data_data_sources.dart';
import 'package:marketi_e_commerce_app/features/home/data/data_sources/user_data_data_sources_impl.dart';
import 'package:marketi_e_commerce_app/features/home/data/repositories/category_repo_impl.dart';
import 'package:marketi_e_commerce_app/features/home/domain/repositories/category_repo.dart';
import 'package:marketi_e_commerce_app/features/home/domain/repositories/product_repo.dart';
import 'package:marketi_e_commerce_app/features/home/domain/repositories/user_data_repo.dart';
import 'package:marketi_e_commerce_app/features/home/domain/usecase/category_usecase.dart';
import 'package:marketi_e_commerce_app/features/home/domain/usecase/product_usecase.dart';
import 'package:marketi_e_commerce_app/features/home/presentation/cubit/category_cubit/category_cubit.dart';
import 'package:marketi_e_commerce_app/features/home/presentation/cubit/product_cubit/product_cubit.dart';
import 'package:marketi_e_commerce_app/features/home/presentation/cubit/user_data_cubit/user_data_cubit.dart';
import '../../features/auth/data/data_sources/login_data_sources.dart';
import '../../features/favourites/domain/usecase/favourites_usecase.dart';
import '../../features/favourites/presentation/cubit/favourites_cubit/favourites_cubit.dart';
import '../../features/home/data/repositories/brand_repo_impl.dart';
import '../../features/home/data/repositories/product_repo_impl.dart';
import '../../features/home/data/repositories/user_data_repo_impl.dart';
import '../../features/home/domain/repositories/brand_repo.dart';
import '../../features/home/domain/usecase/brand_usecase.dart';
import '../../features/home/domain/usecase/user_data_usecase.dart';
import '../../features/home/presentation/cubit/brand_cubit/brand_cubit.dart';
import '../api/api_manager.dart';
import '../api/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // 🔧 Core
  getIt.registerLazySingleton<ApiManager>(
    () => ApiManager(dio: DioFactory.getDio()),
  );

  // 📦 Data Sources
  getIt.registerLazySingleton<LoginRemoteDataSource>(
    () => LoginRemoteDataSourceImpl(getIt<ApiManager>()),
  );

  getIt.registerLazySingleton<SignUpDataSources>(
    () => SignUpDataSourceImpl(getIt<ApiManager>()),
  );

  getIt.registerLazySingleton<SendPassEmailDataSources>(
    () => SendPassEmailDataSourcesImpl(getIt<ApiManager>()),
  );

  getIt.registerLazySingleton<VerifyCodeDataSource>(
    () => VerifyCodeDataSourcesImpl(getIt<ApiManager>()),
  );

  getIt.registerLazySingleton<CreateNewPasswordDataSources>(
    () => CreateNewPasswordDataSourceImpl(getIt<ApiManager>()),
  );

  getIt.registerLazySingleton<UserDataDataSources>(
    () => UserDataDataSourceImpl(getIt<ApiManager>()),
  );

  getIt.registerLazySingleton<ProductDataSources>(
    () => ProductDataSourcesImpl(getIt<ApiManager>()),
  );

  getIt.registerLazySingleton<CategoryDataSources>(
    () => CategoryDataSourcesImpl(getIt<ApiManager>()),
  );


  getIt.registerLazySingleton<BrandDataSources>(
    () => BrandDataSourcesImpl(getIt<ApiManager>()),
  );

  getIt.registerLazySingleton<FavouritesDataSources>(
    () => FavouritesDataSourcesImpl(getIt<ApiManager>()),
  );

  // 📚 Repositories
  getIt.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(getIt<LoginRemoteDataSource>()),
  );

  getIt.registerLazySingleton<SignUpRepo>(
    () => SignUpRepoImpl(getIt<SignUpDataSources>()),
  );

  getIt.registerLazySingleton<SendPassEmailRepo>(
    () => SendPassEmailRepoImpl(getIt<SendPassEmailDataSources>()),
  );

  getIt.registerLazySingleton<VerifyCodeRepo>(
    () => VerifyCodeRepoImpl(getIt<VerifyCodeDataSource>()),
  );

  getIt.registerLazySingleton<CreateNewPasswordRepo>(
    () => CreateNewPasswordRepoImpl(getIt<CreateNewPasswordDataSources>()),
  );

  getIt.registerLazySingleton<UserDataRepo>(
    () => UserDataRepoImpl(getIt<UserDataDataSources>()),
  );

  getIt.registerLazySingleton<ProductRepo>(
    () => ProductRepoImpl(getIt<ProductDataSources>()),
  );

  getIt.registerLazySingleton<CategoryRepo>(
    () => CategoryRepoImpl(getIt<CategoryDataSources>()),
  );

  getIt.registerLazySingleton<BrandRepo>(
    () => BrandRepoImpl(getIt<BrandDataSources>()),
  );


  getIt.registerLazySingleton<FavouritesRepo>(
    () => FavouritesRepoImpl(getIt<FavouritesDataSources>()),
  );

  // ✅ Use Cases
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(getIt<LoginRepository>()),
  );

  getIt.registerLazySingleton<SignUpUseCase>(
    () => SignUpUseCase(getIt<SignUpRepo>()),
  );

  getIt.registerLazySingleton<SendPassEmailUsecase>(
    () => SendPassEmailUsecase(getIt<SendPassEmailRepo>()),
  );

  getIt.registerLazySingleton<VerifyCodeUseCase>(
    () => VerifyCodeUseCase(getIt<VerifyCodeRepo>()),
  );

  getIt.registerLazySingleton<CreateNewPasswordUseCase>(
    () => CreateNewPasswordUseCase(getIt<CreateNewPasswordRepo>()),
  );

  getIt.registerLazySingleton<UserDataUseCase>(
    () => UserDataUseCase(getIt<UserDataRepo>()),
  );
  getIt.registerLazySingleton<ProductUseCase>(
    () => ProductUseCase(getIt<ProductRepo>()),
  );

  getIt.registerLazySingleton<CategoryUseCase>(
    () => CategoryUseCase(getIt<CategoryRepo>()),
  );

  getIt.registerLazySingleton<BrandUsecase>(
    () => BrandUsecase(getIt<BrandRepo>()),
  );


  getIt.registerLazySingleton<FavouritesUseCase>(
    () => FavouritesUseCase(getIt<FavouritesRepo>()),
  );

  // 🧠 Cubits
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginUseCase>()));

  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt<SignUpUseCase>()));

  getIt.registerFactory<SendPassEmailCubit>(
    () => SendPassEmailCubit(getIt<SendPassEmailUsecase>()),
  );

  getIt.registerFactory<VerifyCodeCubit>(
    () => VerifyCodeCubit(getIt<VerifyCodeUseCase>()),
  );

  getIt.registerFactory<CreateNewPasswordCubit>(
    () => CreateNewPasswordCubit(getIt<CreateNewPasswordUseCase>()),
  );

  getIt.registerLazySingleton<UserDataCubit>(
    () => UserDataCubit(getIt<UserDataUseCase>()),
  );

  getIt.registerLazySingleton<ProductCubit>(
        () => ProductCubit(getIt<ProductUseCase>()),
  );


  getIt.registerLazySingleton<CategoryCubit>(
    () => CategoryCubit(getIt<CategoryUseCase>()),
  );

  getIt.registerLazySingleton<BrandCubit>(
    () => BrandCubit(getIt<BrandUsecase>()),
  );

  getIt.registerFactory<FavouritesCubit>(
    () => FavouritesCubit(getIt<FavouritesUseCase>()),
  );
}
