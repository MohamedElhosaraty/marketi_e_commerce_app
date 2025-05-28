import 'package:marketi_e_commerce_app/features/home/domain/entity/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.title,
    required super.description,
    required super.image,
    required super.price,
    required super.rating,
    required super.discount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["_id"],
      title: json["title"],
      description: json["description"],
      image: (json["images"] != null && json["images"].isNotEmpty) ? json["images"][0] : "",
      price: json["price"],
      rating: (json["rating"] as num).toDouble(),
      discount: json["discount"],
    );
  }

  static List<ProductModel> fromListJson(Map<String, dynamic> json) {
    final list = json['list'] as List<dynamic>;
    return list.map((item) => ProductModel.fromJson(item)).toList();
  }
}
