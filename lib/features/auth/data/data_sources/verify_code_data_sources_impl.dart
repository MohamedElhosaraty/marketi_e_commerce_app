import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:marketi_e_commerce_app/core/error/failures.dart';
import 'package:marketi_e_commerce_app/features/auth/data/data_sources/verify_code_data_sources.dart';
import 'package:marketi_e_commerce_app/features/auth/domain/entity/verify_code_entity.dart';

import '../../../../core/api/api_manager.dart';
import '../../../../core/networking/api_constants.dart';
import '../model/verify_code_model.dart';

class VerifyCodeDataSourcesImpl implements VerifyCodeDataSource {
  final ApiManager apiManager;

  VerifyCodeDataSourcesImpl(this.apiManager);

  @override
  Future<Either<Failures, VerifyCodeEntity>> verifyCode(
    String email,
    String code,
  ) async {
    try {
      final response = await apiManager.post(
        endPoint: ApiConstants.verifyCode,
        data: {'email': email, 'code': code},
      );
      final data = VerifyCodeModel.fromJson(response.data);
      return Right(data);
    } catch (e) {
      if(e is DioException){
        return Left(ServerFailure.fromDioException(e));
      }else{
        return Left(ServerFailure(error: e.toString()));
      }
    }
  }
}
