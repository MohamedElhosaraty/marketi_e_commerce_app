import 'package:dartz/dartz.dart';
import 'package:marketi_e_commerce_app/features/home/domain/entity/category_entity.dart';
import 'package:marketi_e_commerce_app/features/home/domain/repositories/category_repo.dart';

import '../../../../core/error/failures.dart';

class CategoryUseCase {

  final CategoryRepo categoryRepo;

  CategoryUseCase(this.categoryRepo);

  Future<Either<Failures, List<CategoryEntity>>> call() async {
    return await categoryRepo.getCategories();
  }
}