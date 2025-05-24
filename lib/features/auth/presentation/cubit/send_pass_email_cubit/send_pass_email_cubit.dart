

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_e_commerce_app/features/auth/domain/usecase/send_pass_email_usecase.dart';

part 'send_pass_email_state.dart';

class SendPassEmailCubit extends Cubit<SendPassEmailState> {
  SendPassEmailCubit(this.sendPassEmailUsecase) : super(SendPassEmailInitial());

  static SendPassEmailCubit get(context) => BlocProvider.of(context);

  final SendPassEmailUsecase sendPassEmailUsecase;
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> sendPassEmail(String email) async {
    emit(SendPassEmailLoading());
    final result = await sendPassEmailUsecase.call(email);
    result.fold((failure) {
      emit(SendPassEmailError(failure.error));
    }, (data) {
      emit(SendPassEmailSuccess(data.message));
    });
  }
}
