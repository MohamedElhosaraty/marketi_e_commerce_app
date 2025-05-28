import 'package:dartz/dartz.dart';
import 'package:marketi_e_commerce_app/features/home/domain/entity/product_entity.dart';

import '../../../../core/error/failures.dart';

abstract class ProductDataSources {
  Future<Either <Failures, List<ProductEntity>>> getProducts();
}