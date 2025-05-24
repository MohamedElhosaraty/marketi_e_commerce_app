import '../../domain/entity/create_new_password_entity.dart';

class CreateNewPasswordModel extends CreateNewPasswordEntity {
  CreateNewPasswordModel({required super.message});

  factory CreateNewPasswordModel.fromJson(Map<String, dynamic> json) {
    return CreateNewPasswordModel(
      message: json['message'],
    );
  }

}