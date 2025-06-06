import 'package:dartz/dartz.dart';
import 'package:marketi_e_commerce_app/features/favourites/domain/entity/favourites_entity.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entity/add_and_remove_favourites_entity.dart';

abstract class FavouritesDataSources {
  Future<Either<Failures, List<FavouritesEntity>>> getFavourites();
  Future<Either<Failures, AddAndRemoveFavouritesEntity>> addFavourites(
      String productId
      );
  Future<Either<Failures, AddAndRemoveFavouritesEntity>> removeFavourites(
      String productId
      );
}