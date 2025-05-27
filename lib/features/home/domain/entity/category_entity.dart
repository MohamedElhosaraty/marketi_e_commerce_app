import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String name;

  final String imagePath;

  const CategoryEntity({
    required this.name,
    required this.imagePath,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [name, imagePath];
}
