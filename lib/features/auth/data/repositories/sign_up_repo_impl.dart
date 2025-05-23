import 'package:dartz/dartz.dart';
import 'package:marketi_e_commerce_app/core/error/failures.dart';

import '../../domain/entity/sign_up_entity.dart';
import '../../domain/repositories/sign_up_repo.dart';
import '../data_sources/sign_up_data_sources.dart';

class SignUpRepoImpl implements SignUpRepo {
  final SignUpDataSources signUpDataSources;

  SignUpRepoImpl(this.signUpDataSources);

  @override
  Future<Either<Failures, SignUpEntity>> signUp(
    String name,
    String phone,
    String email,
    String password,
    String confirmPassword,
  ) async {
    return await signUpDataSources.signUp(name, email, password, confirmPassword);
  }
}
