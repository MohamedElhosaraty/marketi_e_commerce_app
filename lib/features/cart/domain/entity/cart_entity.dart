
import 'package:equatable/equatable.dart';

class CartEntity  extends Equatable{
  final String id;
  final String title;
  final String description;
  final String image;
  final int price;
  final double rating;
  final int discount;
  final String category;

  const CartEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.rating,
    required this.discount,
    required this.category
  });

  @override
  List<Object?> get props => [id,title,description,image,price,rating,discount,category];
}