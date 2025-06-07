import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class AddRateDataSources {
  Future< Either<Failures, Unit>> addRate(String  rate, String productId);
}