import 'package:dartz/dartz.dart';

import 'package:marketi_e_commerce_app/core/error/failures.dart';
import 'package:marketi_e_commerce_app/features/auth/data/data_sources/create_new_password_data_sources.dart';

import 'package:marketi_e_commerce_app/features/auth/domain/entity/create_new_password_entity.dart';

import '../../domain/repositories/create_new_password_repo.dart';

class CreateNewPasswordRepoImpl implements CreateNewPasswordRepo {
  final CreateNewPasswordDataSources createNewPasswordDataSources;

  CreateNewPasswordRepoImpl(this.createNewPasswordDataSources);

  @override
  Future<Either<Failures, CreateNewPasswordEntity>> createNewPassword(
    String email,
    String password,
    String confirmPassword,
  ) async {
    return await createNewPasswordDataSources.createNewPassword(
      email,
      password,
      confirmPassword,
    );
  }
}
