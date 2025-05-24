import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:marketi_e_commerce_app/core/error/failures.dart';
import 'package:marketi_e_commerce_app/features/auth/data/data_sources/send_pass_email_data_sources.dart';
import 'package:marketi_e_commerce_app/features/auth/data/model/send_pass_email_model.dart';

import '../../../../core/api/api_manager.dart';
import '../../../../core/networking/api_constants.dart';

class SendPassEmailDataSourcesImpl implements SendPassEmailDataSources {

  final ApiManager apiManager;

  SendPassEmailDataSourcesImpl(this.apiManager);

  @override
  Future<Either<Failures, SendPassEmailModel>> sendPassEmailDataSources(String email) async  {
    try{
      final response = await apiManager.post(endPoint: ApiConstants.sendPassEmail, data: {'email': email});
      final result = SendPassEmailModel.fromJson(response.data);
      return Right(result);
    }catch(e){
      if(e is DioException){
        return Left(ServerFailure.fromDioException(e));
      }else{
        return Left(ServerFailure(error: e.toString()));
      }
    }
  }


}