import '../../domain/entity/favourites_entity.dart';

class FavouritesModel extends FavouritesEntity {
  const FavouritesModel({
    required super.id,
    required super.title,
    required super.description,
    required super.image,
    required super.price,
    required super.rating,
    required super.discount,
  });

  factory FavouritesModel.fromJson(Map<String, dynamic> json) {
    return FavouritesModel(
      id: json["_id"],
      title: json["title"],
      description: json["description"],
      image:
          (json["images"] != null && json["images"].isNotEmpty)
              ? json["images"][0]
              : "",
      price: json["price"],
      rating: (json["rating"] as num).toDouble(),
      discount: json["discount"],
    );
  }

  static List<FavouritesModel> fromListJson(Map<String, dynamic> json) {
    final list = json['list'] as List<dynamic>;
    return list.map((item) => FavouritesModel.fromJson(item)).toList();
  }
}
