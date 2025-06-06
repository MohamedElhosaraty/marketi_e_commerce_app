import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:marketi_e_commerce_app/core/error/failures.dart';

import 'package:marketi_e_commerce_app/features/favourites/domain/entity/favourites_entity.dart';

import '../../../../core/api/api_manager.dart';
import '../../../../core/networking/api_constants.dart';
import '../../domain/entity/add_and_remove_favourites_entity.dart';
import '../model/add_and_remove_favourites_model.dart';
import '../model/favourites_model.dart';
import 'favourites_data_sources.dart';

class FavouritesDataSourcesImpl implements FavouritesDataSources {

  final ApiManager apiManager;

  FavouritesDataSourcesImpl(this.apiManager);

  @override
  Future<Either<Failures, List<FavouritesEntity>>> getFavourites() async {
    try {
      final response = await apiManager.get(
          endPoint: ApiConstants.getFavourites);

      final data = FavouritesModel.fromListJson(response.data);
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(error: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, AddAndRemoveFavouritesEntity>> addFavourites(
      String productId) async {
    try {
      final response = await apiManager.post(
          endPoint: ApiConstants.addFavourites,
          data: {'productId': productId});
      final data = AddAndRemoveFavouritesModel.fromJson(response.data);
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(error: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, AddAndRemoveFavouritesEntity>> removeFavourites(String productId) async {
    try {
      final response = await apiManager.delete(
          endPoint: ApiConstants.removeFavourites,
          data: {'productId': productId});
      final data = AddAndRemoveFavouritesModel.fromJson(response.data);
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