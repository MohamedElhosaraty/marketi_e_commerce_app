import 'package:dartz/dartz.dart';

import 'package:marketi_e_commerce_app/core/error/failures.dart';
import 'package:marketi_e_commerce_app/features/home/data/data_sources/brand_data_sources.dart';
import 'package:marketi_e_commerce_app/features/home/domain/entity/brand_entity.dart';

import 'package:marketi_e_commerce_app/features/home/domain/repositories/brand_repo.dart';


class BrandRepoImpl implements BrandRepo {

  final BrandDataSources brandDataSources;

  BrandRepoImpl(this.brandDataSources);
  @override
  Future<Either<Failures, List<BrandEntity>>> getBrands() async {
    return await brandDataSources.getBrands();
  }

}