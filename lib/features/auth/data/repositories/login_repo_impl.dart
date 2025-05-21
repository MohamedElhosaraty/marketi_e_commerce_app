
import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../domain/entity/login_entity.dart';
import '../../domain/repositories/login_repo.dart';
import '../data_sources/login_data_sources.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource loginDataSource;

  LoginRepositoryImpl(this.loginDataSource);

  @override
  Future<Either<Failures, LoginEntity>> login(
      String email, String password) async{
    return await loginDataSource.login(email, password, );
  }
}