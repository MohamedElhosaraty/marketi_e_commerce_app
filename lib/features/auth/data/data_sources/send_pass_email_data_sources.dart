import 'package:dartz/dartz.dart';
import 'package:marketi_e_commerce_app/features/auth/data/model/send_pass_email_model.dart';

import '../../../../core/error/failures.dart';

abstract class SendPassEmailDataSources {
  Future<Either<Failures, SendPassEmailModel>> sendPassEmailDataSources(String email);
}
