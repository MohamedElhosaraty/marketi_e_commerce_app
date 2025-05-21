
import '../../domain/entity/login_entity.dart';

class  LoginModel extends LoginEntity{
  LoginModel({required super.token, required super.name, required super.message});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      token: json['token'],
      name: json['name'],
      message: json['message'],
    );
  }
}