import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../entity/sign_up_entity.dart';
import '../repositories/sign_up_repo.dart';

class  SignUpUseCase {
  final SignUpRepo signUpRepo;
  SignUpUseCase(this.signUpRepo);

  Future<Either<Failures, SignUpEntity>> call({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
  })async{
    return await signUpRepo.signUp(
        name, phone, email,  password, confirmPassword,
    );
  }
}