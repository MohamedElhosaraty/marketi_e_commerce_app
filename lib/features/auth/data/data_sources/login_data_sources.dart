
import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../domain/entity/login_entity.dart';

abstract class LoginRemoteDataSource {
  Future<Either<Failures, LoginEntity>> login(
      String email, String password);
}
