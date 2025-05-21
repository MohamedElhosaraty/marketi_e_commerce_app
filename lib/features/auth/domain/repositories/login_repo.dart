
import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../entity/login_entity.dart';

abstract class LoginRepository {
  Future<Either<Failures, LoginEntity>> login(
      String email, String password);
}