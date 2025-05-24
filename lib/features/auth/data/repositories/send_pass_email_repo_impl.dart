import 'package:dartz/dartz.dart';

import 'package:marketi_e_commerce_app/core/error/failures.dart';
import 'package:marketi_e_commerce_app/features/auth/data/data_sources/send_pass_email_data_sources.dart';

import 'package:marketi_e_commerce_app/features/auth/domain/entity/send_pass_email_entity.dart';

import '../../domain/repositories/send_pass_email_repo.dart';

class SendPassEmailRepoImpl implements SendPassEmailRepo {

  final SendPassEmailDataSources sendPassEmailDataSources;

  SendPassEmailRepoImpl(this.sendPassEmailDataSources);

  @override
  Future<Either<Failures, SendPassEmailEntity>> sendPassEmail(String email) async {
    return await sendPassEmailDataSources.sendPassEmailDataSources(email);
  }
}