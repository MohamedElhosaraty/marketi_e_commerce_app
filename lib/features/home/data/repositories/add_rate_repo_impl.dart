import 'package:dartz/dartz.dart';

import 'package:marketi_e_commerce_app/core/error/failures.dart';

import '../../domain/repositories/add_rate_repo.dart';
import '../data_sources/add_rate_data_sources.dart';

class AddRateRepoImpl implements AddRateRepo {

  final AddRateDataSources addRateDataSources;

  AddRateRepoImpl(this.addRateDataSources);
  @override
  Future<Either<Failures, Unit>> addRate(String productId, String rate) async {
    return await addRateDataSources.addRate(rate, productId);
  }
}