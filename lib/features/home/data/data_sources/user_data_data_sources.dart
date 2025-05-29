import 'package:dartz/dartz.dart';
import 'package:marketi_e_commerce_app/features/home/domain/entity/user_data_entity.dart';

import '../../../../core/error/failures.dart';

abstract class UserDataDataSources {
  Future< Either<Failures, UserDataEntity>> getUserData();
}