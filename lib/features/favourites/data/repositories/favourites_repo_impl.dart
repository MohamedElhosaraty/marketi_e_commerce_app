import 'package:dartz/dartz.dart';

import 'package:marketi_e_commerce_app/core/error/failures.dart';

import 'package:marketi_e_commerce_app/features/favourites/domain/entity/favourites_entity.dart';

import '../../domain/entity/add_and_remove_favourites_entity.dart';
import '../../domain/repositories/favourites_repo.dart';
import '../data_sources/favourites_data_sources.dart';

class FavouritesRepoImpl implements FavouritesRepo {

  final FavouritesDataSources favouritesDataSources;

  FavouritesRepoImpl(this.favouritesDataSources);

  @override
  Future<Either<Failures, List<FavouritesEntity>>> getFavourites() async {
     return await favouritesDataSources.getFavourites();
  }

  @override
  Future<Either<Failures, AddAndRemoveFavouritesEntity>> addFavourites(String productId) async {
    return await favouritesDataSources.addFavourites(productId);
  }

  @override
  Future<Either<Failures, AddAndRemoveFavouritesEntity>> removeFavourites(String productId) async{
    return await favouritesDataSources.removeFavourites(productId);
  }
}