import 'package:marketi_e_commerce_app/features/home/domain/entity/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.name,
    required super.imagePath,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'] ?? '',
      imagePath: (json['imagePath'] as String?)?.replaceAll('\\', '/') ?? '',
    );
  }

  static List<CategoryModel> fromListJson(Map<String, dynamic> json) {
    final list = json['list'] as List<dynamic>;
    return list.map((item) => CategoryModel.fromJson(item)).toList();
  }


}
