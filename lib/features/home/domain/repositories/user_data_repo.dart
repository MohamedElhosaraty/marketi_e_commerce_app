import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entity/user_data_entity.dart';

abstract class UserDataRepo {
  Future<Either<Failures, UserDataEntity>> getUserData();
}