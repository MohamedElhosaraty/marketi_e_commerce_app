import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:marketi_e_commerce_app/core/api/api_manager.dart';
import 'package:marketi_e_commerce_app/core/error/failures.dart';
import 'package:marketi_e_commerce_app/features/home/data/data_sources/category_data_sources.dart';
import 'package:marketi_e_commerce_app/features/home/domain/entity/category_entity.dart';

import '../../../../core/networking/api_constants.dart';
import '../model/category_model.dart';

class CategoryDataSourcesImpl implements CategoryDataSources {
  final ApiManager apiManager;

  CategoryDataSourcesImpl(this.apiManager);

  @override
  Future<Either<Failures, List<CategoryEntity>>> getCategories() async {
    try {
      final response = await apiManager.get(endPoint: ApiConstants.categories);
      final data = CategoryModel.fromListJson(response.data);
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
