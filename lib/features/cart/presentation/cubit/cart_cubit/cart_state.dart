import 'package:equatable/equatable.dart';
import '../../../../../core/utils/enum_state.dart';
import '../../../domain/entity/cart_entity.dart';


class CartState extends Equatable {
  final List<CartEntity> cartList;
  final Map<String, int> productCounts;
  final RequestState requestState;
  final String message;
  final double totalPrice;

  const CartState({
    this.cartList = const [],
    this.productCounts = const {},
    this.requestState = RequestState.loading,
    this.message = '',
    this.totalPrice = 0.0,
  });

  // to make a new instance can edit the properties

  CartState copyWith({
    List<CartEntity>? cartList,
    Map<String, int>? productCounts,
    RequestState? requestState,
    String? message,
    double? totalPrice,
  }) {
    return CartState(
      cartList: cartList ?? this.cartList,
      productCounts: productCounts ?? this.productCounts,
      requestState: requestState ?? this.requestState,
      message: message ?? this.message,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }

  @override
  List<Object?> get props => [
    cartList,
    productCounts,
    requestState,
    message,
    totalPrice,
  ];
}
