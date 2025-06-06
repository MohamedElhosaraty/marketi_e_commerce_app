part of 'favourites_cubit.dart';

sealed class FavouritesState {}

final class FavouritesInitial extends FavouritesState {}

final class FavouritesLoading extends FavouritesState {}

final class FavouritesSuccess extends FavouritesState {
  final List<FavouritesEntity> favourites;

  FavouritesSuccess(this.favourites);
}

final class FavouritesError extends FavouritesState {
  final String message;

  FavouritesError(this.message);
}

//----------------------- Add to Favourites -----------------------


class AddFavouritesError extends FavouritesState {
  final String message;

  AddFavouritesError(this.message);
}

//----------------------- Remove from Favourites -----------------------

class RemoveFavouritesError extends FavouritesState {
  final String message;

  RemoveFavouritesError(this.message);
}
