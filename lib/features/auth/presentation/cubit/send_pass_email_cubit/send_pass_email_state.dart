part of 'send_pass_email_cubit.dart';

sealed class SendPassEmailState {}

final class SendPassEmailInitial extends SendPassEmailState {}

final class SendPassEmailLoading extends SendPassEmailState {}

final class SendPassEmailSuccess extends SendPassEmailState {
  final String message;
  SendPassEmailSuccess(this.message);
}

final class SendPassEmailError extends SendPassEmailState {
  final String message;
  SendPassEmailError(this.message);
}
