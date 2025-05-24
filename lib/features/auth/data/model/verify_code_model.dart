import 'package:marketi_e_commerce_app/features/auth/domain/entity/verify_code_entity.dart';

class VerifyCodeModel extends VerifyCodeEntity{
  VerifyCodeModel({required super.message});

  factory VerifyCodeModel.fromJson(Map<String, dynamic> json) {
    return VerifyCodeModel(message: json['message']);
  }

}