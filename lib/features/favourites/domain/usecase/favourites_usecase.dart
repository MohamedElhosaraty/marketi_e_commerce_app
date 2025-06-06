import 'package:dartz/dartz.dart';
import 'package:marketi_e_commerce_app/features/favourites/domain/entity/favourites_entity.dart';

import '../../../../core/error/failures.dart';
import '../entity/add_and_remove_favourites_entity.dart';
import '../repositories/favourites_repo.dart';

class FavouritesUseCase {

  final FavouritesRepo favouritesRepo;

  FavouritesUseCase(this.favouritesRepo);

  Future<Either<Failures, List<FavouritesEntity>>> call() async {
    return await favouritesRepo.getFavourites();
  }


  Future<Either<Failures, AddAndRemoveFavouritesEntity>> addFavourites(String productId) async {
    return await favouritesRepo.addFavourites(productId);
  }

  Future<Either<Failures, AddAndRemoveFavouritesEntity>> removeFavourites(String productId) async {
    return await favouritesRepo.removeFavourites(productId);
  }
}