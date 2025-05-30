import 'package:dartz/dartz.dart';
import 'package:marketi_e_commerce_app/features/home/domain/entity/brand_entity.dart';
import 'package:marketi_e_commerce_app/features/home/domain/repositories/brand_repo.dart';

import '../../../../core/error/failures.dart';

class BrandUsecase {

  final BrandRepo brandRepo;

  BrandUsecase(this.brandRepo);

  Future<Either<Failures, List<BrandEntity>>> call() async {
    return await brandRepo.getBrands();
  }
}