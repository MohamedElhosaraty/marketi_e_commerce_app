part of 'checkout__cubit.dart';

sealed class CheckoutState {}

final class CheckoutInitial extends CheckoutState {}

final class OpenMapSuccess extends CheckoutState {}
final class MapOpenFailure extends CheckoutState {
  final String error;
  MapOpenFailure(this.error);
}
