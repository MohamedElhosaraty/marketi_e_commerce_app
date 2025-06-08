part of 'add_rate_cubit.dart';

sealed class AddRateState {}

final class AddRateInitial extends AddRateState {}

final class AddRateSuccess extends AddRateState {}

final class AddRateError extends AddRateState {
  final String error;
  AddRateError(this.error);
}
