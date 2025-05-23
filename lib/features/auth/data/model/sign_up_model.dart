
import '../../domain/entity/sign_up_entity.dart';

class SignUpModel extends SignUpEntity{
  SignUpModel({required super.message});

  factory SignUpModel.fromJson(Map<String,dynamic> json){
    return SignUpModel(message: json['message']);
  }

}