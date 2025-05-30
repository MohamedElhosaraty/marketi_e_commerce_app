part of 'brand_cubit.dart';

sealed class BrandState {}

final class BrandInitial extends BrandState {}

final class BrandLoading extends BrandState {}

final class BrandSuccess extends BrandState {
  final List<BrandEntity> brands;
  BrandSuccess(this.brands);
}

final class BrandError extends BrandState {
  final String message;
  BrandError(this.message);
}
