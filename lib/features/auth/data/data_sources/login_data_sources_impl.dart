import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/api/api_manager.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/networking/api_constants.dart';
import '../../domain/entity/login_entity.dart';
import '../model/login_model.dart';
import 'login_data_sources.dart';

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final ApiManager apiManager;

  LoginRemoteDataSourceImpl(this.apiManager);

  @override
  Future<Either<Failures, LoginEntity>> login(
      String email,
      String password,
      ) async {
    try {
      final response =
      await apiManager.post(endPoint: ApiConstants.login, data: {
        'email': email,
        'password': password,
      });
      final data = LoginModel.fromJson(response.data);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(error: e.toString()));
      }
    }
  }
}
