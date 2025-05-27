import 'package:dartz/dartz.dart';

import 'package:marketi_e_commerce_app/core/error/failures.dart';
import 'package:marketi_e_commerce_app/features/home/data/data_sources/category_data_sources.dart';

import 'package:marketi_e_commerce_app/features/home/domain/entity/category_entity.dart';

import '../../domain/repositories/category_repo.dart';

class CategoryRepoImpl implements CategoryRepo {

  final CategoryDataSources categoryDataSources;

  CategoryRepoImpl(this.categoryDataSources);
  @override
  Future<Either<Failures, List<CategoryEntity>>> getCategories() async {
    return await categoryDataSources.getCategories();
  }

}