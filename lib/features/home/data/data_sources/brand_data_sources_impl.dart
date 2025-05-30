import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:marketi_e_commerce_app/core/api/api_manager.dart';
import 'package:marketi_e_commerce_app/core/error/failures.dart';
import 'package:marketi_e_commerce_app/features/home/data/data_sources/brand_data_sources.dart';
import 'package:marketi_e_commerce_app/features/home/data/model/brand_model.dart';
import 'package:marketi_e_commerce_app/features/home/domain/entity/brand_entity.dart';

import '../../../../core/networking/api_constants.dart';

class BrandDataSourcesImpl implements BrandDataSources {
  final ApiManager apiManager;

  BrandDataSourcesImpl(this.apiManager);

  @override
  Future<Either<Failures, List<BrandEntity>>> getBrands() async {
    try {
      final response = await apiManager.get(endPoint: ApiConstants.brands);
      final data = BrandModel.fromListJson(response.data);
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
