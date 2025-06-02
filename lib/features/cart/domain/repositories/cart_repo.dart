import '../../../../core/error/failures.dart';
import '../entity/add_delete_cart_entity.dart';
import '../entity/cart_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CartRepo {
  Future<Either<Failures, List<CartEntity>>> getCart();

  Future<Either<Failures, AddAndDeleteCartEntity>> addToCart(String productId);

  Future<Either<Failures, AddAndDeleteCartEntity>> removeFromCart(
    String productId,
  );
}
