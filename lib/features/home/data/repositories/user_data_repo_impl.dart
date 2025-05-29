import 'package:dartz/dartz.dart';

import 'package:marketi_e_commerce_app/core/error/failures.dart';
import 'package:marketi_e_commerce_app/features/home/data/data_sources/user_data_data_sources.dart';

import 'package:marketi_e_commerce_app/features/home/domain/entity/user_data_entity.dart';

import '../../domain/repositories/user_data_repo.dart';

class UserDataRepoImpl implements UserDataRepo {

  final UserDataDataSources userDataDataSources;

  UserDataRepoImpl(this.userDataDataSources);

  @override
  Future<Either<Failures, UserDataEntity>> getUserData() {
    return userDataDataSources.getUserData();
  }
}