import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:marketi_e_commerce_app/core/error/failures.dart';
import 'package:marketi_e_commerce_app/features/home/data/data_sources/user_data_data_sources.dart';
import 'package:marketi_e_commerce_app/features/home/domain/entity/user_data_entity.dart';

import '../../../../core/api/api_manager.dart';
import '../../../../core/networking/api_constants.dart';
import '../model/user_data_model.dart';

class UserDataDataSourceImpl implements UserDataDataSources {

  final ApiManager apiManager;

  UserDataDataSourceImpl(this.apiManager);

  @override
  Future<Either<Failures, UserDataEntity>> getUserData() async {
    try {
      final response = await apiManager.get(endPoint: ApiConstants.userData);
      final data = UserDataModel.fromJson(response.data);
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