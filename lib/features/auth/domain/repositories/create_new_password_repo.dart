import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entity/create_new_password_entity.dart';

abstract class CreateNewPasswordRepo {
  Future<Either<Failures, CreateNewPasswordEntity>> createNewPassword(
    String email,
    String password,
    String confirmPassword,
  );
}
