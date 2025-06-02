import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/enum_state.dart';
import '../../../domain/usecase/cart_usecase.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartUseCase cartUseCase;

  CartCubit(this.cartUseCase) : super(const CartState());

  Future<void> getCart() async {
    emit(state.copyWith(requestState: RequestState.loading, message: ''));

    final result = await cartUseCase.getCart();
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            requestState: RequestState.error,
            message: failure.error,
            cartList: [],
            productCounts: {},
            totalPrice: 0.0,
          ),
        );
      },
      (cart) {
        final Map<String, int> counts = {};
        double total = 0;

        for (var item in cart) {
          final count = state.productCounts[item.id] ?? 1;
          counts[item.id] = count;
          total += (item.price * (1 - item.discount / 100)) * count;
        }

        emit(
          state.copyWith(
            requestState: RequestState.success,
            cartList: cart,
            productCounts: counts,
            message: '',
            totalPrice: total,
          ),
        );
      },
    );
  }

  Future<void> addToCart(String productId) async {
    emit(state.copyWith(requestState: RequestState.loading, message: ''));

    final result = await cartUseCase.addToCart(productId);
    result.fold((failure) {
      emit(
        state.copyWith(
          requestState: RequestState.error,
          message: failure.error,
        ),
      );
    }, (_) => getCart());
  }

  Future<void> deleteFromCart(String productId) async {
    emit(state.copyWith(requestState: RequestState.loading, message: ''));

    final result = await cartUseCase.removeFromCart(productId);
    result.fold((failure) {
      emit(
        state.copyWith(
          requestState: RequestState.error,
          message: failure.error,
        ),
      );
    }, (_) => getCart());
  }

  void incrementProduct(String productId) {
    // copy old map
    final updatedCounts = Map<String, int>.from(state.productCounts);
    updatedCounts[productId] = (updatedCounts[productId] ?? 1) + 1;
    _updateTotalPrice(updatedCounts);
  }

  void _updateTotalPrice(Map<String, int> updatedCounts) {
    double total = 0;
    for (var item in state.cartList) {
      final count = updatedCounts[item.id] ?? 1;
      total += (item.price * (1 - item.discount / 100)) * count;
    }
    emit(state.copyWith(productCounts: updatedCounts, totalPrice: total));
  }

  void decrementProduct(String productId) {
    final updatedCounts = Map<String, int>.from(state.productCounts);
    final currentCount = updatedCounts[productId] ?? 1;
    if (currentCount > 1) {
      updatedCounts[productId] = currentCount - 1;
      _updateTotalPrice(updatedCounts);
    }
  }
}
