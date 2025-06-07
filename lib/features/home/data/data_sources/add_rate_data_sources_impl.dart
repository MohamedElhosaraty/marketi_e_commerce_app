import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:marketi_e_commerce_app/core/error/failures.dart';

import '../../../../core/api/api_manager.dart';
import '../../../../core/networking/api_constants.dart';
import 'add_rate_data_sources.dart';

class AddRateDataSourcesImpl implements AddRateDataSources{

  final ApiManager apiManager;

  AddRateDataSourcesImpl(this.apiManager);
  @override
  Future<Either<Failures, Unit>> addRate(String rate, String productId)async {
    try {
       await apiManager.post(endPoint: ApiConstants.addRate,
        data: {'rating': rate, 'productId': productId},);
      return Right(unit);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(error: e.toString()));
      }
    }
  }
}