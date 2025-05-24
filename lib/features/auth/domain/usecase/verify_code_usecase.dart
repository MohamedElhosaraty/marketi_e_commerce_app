import 'package:dartz/dartz.dart';
import 'package:marketi_e_commerce_app/core/error/failures.dart';
import 'package:marketi_e_commerce_app/features/auth/domain/entity/verify_code_entity.dart';

import '../repositories/verify_code_repo.dart';

class VerifyCodeUseCase {

  final VerifyCodeRepo verifyCodeRepo;

  VerifyCodeUseCase(this.verifyCodeRepo);
  Future<Either <Failures, VerifyCodeEntity>> call(String email,String code) async {
    return await verifyCodeRepo.verifyCode(email ,code);
  }
}