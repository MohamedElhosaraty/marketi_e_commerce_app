import 'package:dartz/dartz.dart';

import 'package:marketi_e_commerce_app/core/error/failures.dart';
import 'package:marketi_e_commerce_app/features/auth/data/data_sources/verify_code_data_sources.dart';

import 'package:marketi_e_commerce_app/features/auth/domain/entity/verify_code_entity.dart';

import '../../domain/repositories/verify_code_repo.dart';

class VerifyCodeRepoImpl implements VerifyCodeRepo {
  final VerifyCodeDataSource verifyCodeDataSources;

  VerifyCodeRepoImpl(this.verifyCodeDataSources);

  @override
  Future<Either<Failures, VerifyCodeEntity>> verifyCode(
    String email,
    String code,
  ) async {
    return await verifyCodeDataSources.verifyCode(email, code);
  }
}
