import 'package:marketi_e_commerce_app/features/home/domain/entity/user_data_entity.dart';

class UserDataModel extends UserDataEntity {
  UserDataModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phone,
    required super.image,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      id: json['message']['_id'],
      name: json['message']['name'],
      email: json['message']['email'],
      phone: json['message']['phone'],
      image: json['message']['image'],
    );
  }
}
