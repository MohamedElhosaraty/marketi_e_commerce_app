import 'package:equatable/equatable.dart';

class FavouritesEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final String image;
  final int price;
  final double rating;
  final int discount;

  const FavouritesEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.rating,
    required this.discount,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    title,
    description,
    image,
    price,
    rating,
    discount,
  ];
}
