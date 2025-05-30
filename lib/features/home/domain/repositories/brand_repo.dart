import 'package:dartz/dartz.dart';
import 'package:marketi_e_commerce_app/features/home/domain/entity/brand_entity.dart';

import '../../../../core/error/failures.dart';

abstract class BrandRepo {
  Future<Either<Failures, List<BrandEntity>>> getBrands();
}