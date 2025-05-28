import 'package:dartz/dartz.dart';
import 'package:marketi_e_commerce_app/core/error/failures.dart';
import 'package:marketi_e_commerce_app/features/home/domain/entity/product_entity.dart';
import 'package:marketi_e_commerce_app/features/home/domain/repositories/product_repo.dart';

import '../data_sources/product_data_sources.dart';

class ProductRepoImpl implements ProductRepo{

  final ProductDataSources productDataSources;

  ProductRepoImpl(this.productDataSources);

  @override
  Future<Either<Failures, List<ProductEntity>>> getProducts() async {
    return await productDataSources.getProducts();
  }
}