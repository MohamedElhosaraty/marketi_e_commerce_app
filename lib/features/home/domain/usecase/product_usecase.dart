import 'package:dartz/dartz.dart';
import 'package:marketi_e_commerce_app/features/home/domain/entity/product_entity.dart';
import 'package:marketi_e_commerce_app/features/home/domain/repositories/product_repo.dart';

import '../../../../core/error/failures.dart';

class ProductUseCase {

  final ProductRepo productRepo;

  ProductUseCase(this.productRepo);

  Future<Either<Failures, List<ProductEntity>>> call() async {
    return await productRepo.getProducts();
  }
}