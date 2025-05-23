import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:marketi_e_commerce_app/core/error/failures.dart';
import 'package:marketi_e_commerce_app/features/auth/data/data_sources/sign_up_data_sources.dart';

import '../../../../../core/api/api_manager.dart';
import '../../../../../core/networking/api_constants.dart';
import '../../domain/entity/sign_up_entity.dart';
import '../model/sign_up_model.dart';

class SignUpDataSourceImpl implements SignUpDataSources {

  final ApiManager apiManager;

  SignUpDataSourceImpl(this.apiManager);

  @override
  Future<Either<Failures, SignUpEntity>> signUp(
    String name,
    String email,
    String password,
    String confirmPassword,
  ) async {
    try{
      final response = await apiManager.post(endPoint: ApiConstants.signup, data: {
        'name': name,
        'email': email,
        'password': password,
        'confirmPassword': confirmPassword,
      });
      final data = SignUpModel.fromJson(response.data);
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
