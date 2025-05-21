import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../entity/login_entity.dart';
import '../repositories/login_repo.dart';

class LoginUseCase  {
  final LoginRepository repository;

  LoginUseCase(this.repository);

  Future<Either<Failures, LoginEntity>> call(
      String email, String password) async {
    return await repository.login(email, password);
  }
}
