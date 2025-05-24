import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entity/verify_code_entity.dart';

abstract class VerifyCodeRepo {
  Future<Either<Failures, VerifyCodeEntity>> verifyCode(
    String email,
    String code,
  );
}
