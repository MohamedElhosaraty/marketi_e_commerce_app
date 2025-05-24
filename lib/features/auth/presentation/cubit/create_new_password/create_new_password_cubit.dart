
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/create_new_paassword_usecase.dart';

part 'create_new_password_state.dart';

class CreateNewPasswordCubit extends Cubit<CreateNewPasswordState> {
  CreateNewPasswordCubit(this.createNewPasswordUseCase) : super(CreateNewPasswordInitial());

  static CreateNewPasswordCubit get(context) => BlocProvider.of(context);

  final CreateNewPasswordUseCase createNewPasswordUseCase;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  void changePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(ChangePasswordVisibility());
  }

  void changeConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    emit(ChangeConfirmPasswordVisibility());
  }

  Future<void> createNewPassword(
      String email,
      String password,
      String confirmPassword
      ) async {
    emit(CreateNewPasswordLoading());
    final result = await createNewPasswordUseCase.call(
      email,
      password,
      confirmPassword
    );
    result.fold((failure) {
      emit(CreateNewPasswordError(failure.error));
    }, (data) {
      emit(CreateNewPasswordSuccess(data.message));
    });
  }
}
