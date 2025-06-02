import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entity/add_delete_cart_entity.dart';
import '../../domain/entity/cart_entity.dart';

abstract class CartDataSources {
  Future<Either<Failures, List<CartEntity>>> getCart();

  Future<Either<Failures, AddAndDeleteCartEntity>> addToCart(String productId);

  Future<Either<Failures, AddAndDeleteCartEntity>> removeFromCart(
    String productId,
  );
}
