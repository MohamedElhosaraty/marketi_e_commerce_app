import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entity/category_entity.dart';

abstract class CategoryRepo {
  Future<Either<Failures, List<CategoryEntity>>> getCategories();
}