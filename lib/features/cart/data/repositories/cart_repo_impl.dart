import 'package:dartz/dartz.dart';

import 'package:marketi_e_commerce_app/core/error/failures.dart';

import 'package:marketi_e_commerce_app/features/cart/domain/entity/add_delete_cart_entity.dart';

import 'package:marketi_e_commerce_app/features/cart/domain/entity/cart_entity.dart';

import '../../domain/repositories/cart_repo.dart';
import '../data_sources/cart_data_sources.dart';

class CartRepoImpl implements CartRepo{

  final CartDataSources cartDataSources;
  CartRepoImpl(this.cartDataSources);

  @override
  Future<Either<Failures, AddAndDeleteCartEntity>> addToCart(String productId) async{
    return await cartDataSources.addToCart(productId);
  }

  @override
  Future<Either<Failures, List<CartEntity>>> getCart() async {
    return await cartDataSources.getCart();
  }

  @override
  Future<Either<Failures, AddAndDeleteCartEntity>> removeFromCart(String productId) async{
    return await cartDataSources.removeFromCart(productId);
  }
}