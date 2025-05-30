import 'package:equatable/equatable.dart';

class BrandEntity extends Equatable {
  final String name;

  final String imagePath;

  const BrandEntity({
    required this.name,
    required this.imagePath,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [name, imagePath];
}
