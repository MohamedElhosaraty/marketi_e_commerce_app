import 'package:dartz/dartz.dart';
import 'package:marketi_e_commerce_app/features/auth/domain/entity/create_new_password_entity.dart';
import 'package:marketi_e_commerce_app/features/auth/domain/repositories/create_new_password_repo.dart';

import '../../../../core/error/failures.dart';

class CreateNewPasswordUseCase {
  final CreateNewPasswordRepo createNewPasswordRepo;

  CreateNewPasswordUseCase(this.createNewPasswordRepo);

  Future<Either<Failures, CreateNewPasswordEntity>> call(
    String email,
    String password,
    String confirmPassword,
  ) async {
    return await createNewPasswordRepo.createNewPassword(
      email,
      password,
      confirmPassword,
    );
  }
}
