import 'package:marketi_e_commerce_app/features/auth/domain/entity/send_pass_email_entity.dart';

class SendPassEmailModel extends SendPassEmailEntity{
  SendPassEmailModel({required super.message});

  factory SendPassEmailModel.fromJson(Map<String, dynamic> json) {
    return SendPassEmailModel(
      message: json['message'],
    );
  }

}