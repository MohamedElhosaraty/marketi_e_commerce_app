part of 'create_new_password_cubit.dart';

sealed class CreateNewPasswordState {}

final class CreateNewPasswordInitial extends CreateNewPasswordState {}

final class ChangePasswordVisibility extends CreateNewPasswordState {}

final class ChangeConfirmPasswordVisibility extends CreateNewPasswordState {}

final class CreateNewPasswordLoading extends CreateNewPasswordState {}

final class CreateNewPasswordSuccess extends CreateNewPasswordState {
  final String message;
  CreateNewPasswordSuccess(this.message);
}

final class CreateNewPasswordError extends CreateNewPasswordState {
  final String message;
  CreateNewPasswordError(this.message);
}
