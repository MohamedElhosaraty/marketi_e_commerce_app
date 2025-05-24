import 'package:dartz/dartz.dart';
import 'package:marketi_e_commerce_app/features/auth/domain/entity/verify_code_entity.dart';

import '../../../../core/error/failures.dart';

abstract class VerifyCodeDataSource {
  Future<Either<Failures, VerifyCodeEntity>> verifyCode(
    String email,
    String code,
  );
}
