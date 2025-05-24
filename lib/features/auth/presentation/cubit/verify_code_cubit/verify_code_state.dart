part of 'verify_code_cubit.dart';

sealed class VerifyCodeState {}

final class VerifyCodeInitial extends VerifyCodeState {}

final class VerifyCodeLoading extends VerifyCodeState {}

final class VerifyCodeSuccess extends VerifyCodeState {
  final String message;
  VerifyCodeSuccess(this.message);
}

final class VerifyCodeError extends VerifyCodeState {
  final String message;
  VerifyCodeError(this.message);
}
