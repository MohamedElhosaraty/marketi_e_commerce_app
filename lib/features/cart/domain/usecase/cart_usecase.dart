import 'package:dartz/dartz.dart';
import 'package:marketi_e_commerce_app/features/cart/domain/entity/add_delete_cart_entity.dart';

import '../../../../core/error/failures.dart';
import '../entity/cart_entity.dart';
import '../repositories/cart_repo.dart';

class CartUseCase {
  final CartRepo cartRepo;

  CartUseCase(this.cartRepo);

  Future<Either<Failures, List<CartEntity>>> getCart() async {
    return await cartRepo.getCart();
  }

  Future<Either<Failures, AddAndDeleteCartEntity>> addToCart(
    String productId,
  ) async {
    return await cartRepo.addToCart(productId);
  }

  Future<Either<Failures, AddAndDeleteCartEntity>> removeFromCart(
    String productId,
  ) async {
    return await cartRepo.removeFromCart(productId);
  }
}
