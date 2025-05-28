import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:marketi_e_commerce_app/core/error/failures.dart';
import 'package:marketi_e_commerce_app/features/home/data/data_sources/product_data_sources.dart';
import 'package:marketi_e_commerce_app/features/home/domain/entity/product_entity.dart';

import '../../../../core/api/api_manager.dart';
import '../../../../core/networking/api_constants.dart';
import '../model/product_model.dart';

class ProductDataSourcesImpl implements ProductDataSources {

  final ApiManager apiManager;

  ProductDataSourcesImpl(this.apiManager);

  @override
  Future<Either<Failures, List<ProductEntity>>> getProducts() async {
    try {
      final response = await apiManager.get(endPoint: ApiConstants.products);
      final data = ProductModel.fromListJson(response.data);
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