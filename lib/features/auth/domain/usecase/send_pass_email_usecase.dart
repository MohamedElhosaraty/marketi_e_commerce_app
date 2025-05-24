import 'package:dartz/dartz.dart';
import 'package:marketi_e_commerce_app/features/auth/domain/entity/send_pass_email_entity.dart';
import 'package:marketi_e_commerce_app/features/auth/domain/repositories/send_pass_email_repo.dart';

import '../../../../core/error/failures.dart';

class SendPassEmailUsecase {

  final SendPassEmailRepo sendPassEmailRepo;

  SendPassEmailUsecase(this.sendPassEmailRepo);
  Future<Either<Failures, SendPassEmailEntity>> call(String email) async {
    return await sendPassEmailRepo.sendPassEmail(email);
  }
}