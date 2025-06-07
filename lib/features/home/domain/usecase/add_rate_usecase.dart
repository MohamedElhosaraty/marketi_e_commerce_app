import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/add_rate_repo.dart';

class AddRateUseCase {

  final AddRateRepo addRateRepo;

  AddRateUseCase(this.addRateRepo);
  Future<Either<Failures, Unit>> call(String productId, String rate) async{

   return await addRateRepo.addRate(productId, rate);
  }
}