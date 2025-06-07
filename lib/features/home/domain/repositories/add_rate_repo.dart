import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class AddRateRepo {
  Future<Either<Failures, Unit>> addRate(String productId, String rate);
}