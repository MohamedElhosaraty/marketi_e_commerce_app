import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../domain/entity/sign_up_entity.dart';

 abstract class SignUpDataSources {
  Future<Either<Failures, SignUpEntity>> signUp(
      String name,
      String email,
      String password,
      String confirmPassword,

      ) ;
}