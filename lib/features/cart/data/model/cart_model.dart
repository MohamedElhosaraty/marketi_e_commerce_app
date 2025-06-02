import 'package:marketi_e_commerce_app/features/cart/domain/entity/cart_entity.dart';

class CartModel extends CartEntity {
  const CartModel({
    required super.id,
    required super.title,
    required super.description,
    required super.image,
    required super.price,
    required super.rating,
    required super.discount,
    required super.category,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json["_id"],
      title: json["title"],
      description: json["description"],
      image: (json["images"] != null && json["images"].isNotEmpty) ? json["images"][0] : "",
      price: json["price"],
      rating: (json["rating"] as num).toDouble(),
      discount: json["discount"],
      category: json["category"],
    );
  }

  static List<CartModel> fromListJson(Map<String, dynamic> json) {
    final list = json['list'] as List<dynamic>;
    return list.map((item) => CartModel.fromJson(item)).toList();
  }
}
