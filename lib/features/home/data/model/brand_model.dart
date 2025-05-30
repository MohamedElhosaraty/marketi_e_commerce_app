import 'package:marketi_e_commerce_app/features/home/domain/entity/brand_entity.dart';

class BrandModel extends BrandEntity {
  const BrandModel({
    required super.name,
    required super.imagePath,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      name: json['name'] ?? '',
      imagePath: (json['imagePath'] as String?)?.replaceAll('\\', '/') ?? '',
    );
  }

  static List<BrandModel> fromListJson(Map<String, dynamic> json) {
    final list = json['list'] as List<dynamic>;
    return list.map((item) => BrandModel.fromJson(item)).toList();
  }


}
