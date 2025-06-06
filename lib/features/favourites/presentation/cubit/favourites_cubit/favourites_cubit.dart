import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_e_commerce_app/features/favourites/domain/usecase/favourites_usecase.dart';

import '../../../domain/entity/favourites_entity.dart';

part 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  FavouritesCubit(this.favouritesUseCase) : super(FavouritesInitial());

  static FavouritesCubit get(context) => BlocProvider.of(context);

  final FavouritesUseCase favouritesUseCase;

  List<FavouritesEntity> favouritesList = [];

  Future<void> getFavourites() async {
    emit(FavouritesLoading());
    final result = await favouritesUseCase.call();
    result.fold(
          (failure) => emit(FavouritesError(failure.error)),
          (favourites) {
        favouritesList = favourites;
        emit(FavouritesSuccess(favourites));
      },
    );
  }

  Future<void> addToFavourites(String productId) async {
    final result = await favouritesUseCase.addFavourites(productId);
    result.fold(
          (failure) => emit(AddFavouritesError(failure.error)),
          (favourites) async{
           await getFavourites();
      },
    );
  }

  Future<void> removeFavourites(String productId) async {
    final result = await favouritesUseCase.removeFavourites(productId);
    result.fold(
          (failure) => emit(RemoveFavouritesError(failure.error)),
          (favourites) async {
           await getFavourites();
      },
    );
  }

}