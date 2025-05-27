import 'package:dartz/dartz.dart';
import 'package:marketi_e_commerce_app/features/home/domain/entity/category_entity.dart';

import '../../../../core/error/failures.dart';

abstract class CategoryDataSources {
  Future<Either<Failures, List<CategoryEntity>>> getCategories();
}