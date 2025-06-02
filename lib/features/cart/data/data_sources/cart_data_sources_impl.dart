import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:marketi_e_commerce_app/core/error/failures.dart';

import 'package:marketi_e_commerce_app/features/cart/domain/entity/add_delete_cart_entity.dart';

import 'package:marketi_e_commerce_app/features/cart/domain/entity/cart_entity.dart';

import '../../../../core/api/api_manager.dart';
import '../../../../core/networking/api_constants.dart';
import '../model/add_and_delete_cart_model.dart';
import '../model/cart_model.dart';
import 'cart_data_sources.dart';

class CartDataSourcesImpl implements CartDataSources {
  final ApiManager apiManager;

  CartDataSourcesImpl(this.apiManager);

  @override
  Future<Either<Failures, AddAndDeleteCartEntity>> addToCart(
    String productId,
  ) async {
    try {
      final response = await apiManager.post(
        endPoint: ApiConstants.addToCart,
        data: {'productId': productId},
      );
      final data = AddAndDeleteCartModel.fromJson(response.data);
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
  Future<Either<Failures, List<CartEntity>>> getCart() async {
    try {
      final response = await apiManager.get(endPoint: ApiConstants.getCart);
      final data = CartModel.fromListJson(response.data);
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
  Future<Either<Failures, AddAndDeleteCartEntity>> removeFromCart(
    String productId,
  ) async {
    try {
      final response = await apiManager.delete(
        endPoint: ApiConstants.removeFromCart,
        data: {'productId': productId},
      );
      final data = AddAndDeleteCartModel.fromJson(response.data);
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
