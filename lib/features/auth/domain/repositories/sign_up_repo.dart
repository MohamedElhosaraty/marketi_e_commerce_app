import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../entity/sign_up_entity.dart';

abstract class SignUpRepo {
  Future<Either<Failures, SignUpEntity>> signUp(
    String name,
    String phone,
    String email,
    String password,
    String confirmPassword,
  );
}
