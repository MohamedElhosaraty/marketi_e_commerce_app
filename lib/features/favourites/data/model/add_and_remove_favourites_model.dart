import 'package:marketi_e_commerce_app/features/favourites/domain/entity/add_and_remove_favourites_entity.dart';

class AddAndRemoveFavouritesModel extends AddAndRemoveFavouritesEntity {
  AddAndRemoveFavouritesModel({required super.message});

  factory AddAndRemoveFavouritesModel.fromJson(Map<String, dynamic> json) {
    return AddAndRemoveFavouritesModel(
      message: json['message'],
    );
  }

}