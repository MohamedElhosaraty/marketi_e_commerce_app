import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:marketi_e_commerce_app/core/error/failures.dart';
import 'package:marketi_e_commerce_app/features/auth/data/data_sources/create_new_password_data_sources.dart';
import 'package:marketi_e_commerce_app/features/auth/data/model/create_new_password_model.dart';
import 'package:marketi_e_commerce_app/features/auth/domain/entity/create_new_password_entity.dart';

import '../../../../core/api/api_manager.dart';
import '../../../../core/networking/api_constants.dart';

class CreateNewPasswordDataSourceImpl implements CreateNewPasswordDataSources {
  final ApiManager apiManager;

  CreateNewPasswordDataSourceImpl(this.apiManager);

  @override
  Future<Either<Failures, CreateNewPasswordEntity>> createNewPassword(
    String email,
    String password,
    String confirmPassword,
  ) async {
    try {
      final response = await apiManager.post(
          endPoint: ApiConstants.createNewPassword ,
          data: {
            'email': email,
            'password': password,
            'confirmPassword': confirmPassword
          });
      final data = CreateNewPasswordModel.fromJson(response.data);
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(error: e.toString()));
      }
    }
  }
}
