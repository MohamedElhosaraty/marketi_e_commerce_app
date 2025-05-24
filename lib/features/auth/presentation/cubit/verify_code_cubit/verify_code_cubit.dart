

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_e_commerce_app/features/auth/domain/usecase/verify_code_usecase.dart';

part 'verify_code_state.dart';

class VerifyCodeCubit extends Cubit<VerifyCodeState> {
  VerifyCodeCubit(this.verifyCodeUsecase) : super(VerifyCodeInitial());

  final VerifyCodeUseCase verifyCodeUsecase;

  Future<void> verifyCode(String email,String code)async{
    emit(VerifyCodeLoading());
    final result = await verifyCodeUsecase.call(email, code);
    result.fold((failure) {
      emit(VerifyCodeError(failure.error));
    }, (data) {
      emit(VerifyCodeSuccess(data.message));
    });
  }
}
