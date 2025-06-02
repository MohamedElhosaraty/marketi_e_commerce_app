import 'package:marketi_e_commerce_app/features/cart/domain/entity/add_delete_cart_entity.dart';

class AddAndDeleteCartModel extends AddAndDeleteCartEntity {
  AddAndDeleteCartModel({required super.message});

  factory AddAndDeleteCartModel.fromJson(Map<String, dynamic> json) {
    return AddAndDeleteCartModel(
      message: json['message'],
    );
  }
}
