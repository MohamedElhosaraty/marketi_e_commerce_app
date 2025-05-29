import 'package:dartz/dartz.dart';
import 'package:marketi_e_commerce_app/features/home/domain/repositories/user_data_repo.dart';

import '../../../../core/error/failures.dart';
import '../entity/user_data_entity.dart';

class UserDataUseCase {

  final UserDataRepo userDataRepo;

  UserDataUseCase(this.userDataRepo);

  Future<Either<Failures, UserDataEntity>> getUserData() async {
    return await userDataRepo.getUserData();
  }
}