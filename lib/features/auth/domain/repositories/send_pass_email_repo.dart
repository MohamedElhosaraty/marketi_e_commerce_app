import 'package:dartz/dartz.dart';
import 'package:marketi_e_commerce_app/features/auth/domain/entity/send_pass_email_entity.dart';

import '../../../../core/error/failures.dart';

abstract class SendPassEmailRepo {
  Future<Either<Failures, SendPassEmailEntity>> sendPassEmail(
      String email);
}
