part of 'user_data_cubit.dart';

sealed class UserDataState {}

final class UserDataInitial extends UserDataState {}

final class UserDataLoading extends UserDataState {}

final class UserDataSuccess extends UserDataState {

  final UserDataEntity userData;

  UserDataSuccess(this.userData);
}

final class UserDataError extends UserDataState {

  final String message;

  UserDataError(this.message);
}
