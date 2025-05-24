import 'package:dartz/dartz.dart';
import 'package:marketi_e_commerce_app/features/auth/domain/entity/create_new_password_entity.dart';

import '../../../../core/error/failures.dart';

abstract class CreateNewPasswordDataSources {
  Future<Either<Failures, CreateNewPasswordEntity>> createNewPassword(
    String email,
    String password,
    String confirmPassword,
  );
}
