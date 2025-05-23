import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entity/sign_up_entity.dart';
import '../../../domain/usecase/sign_up_usecase.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.signUpUseCase) : super(SignUpInitial());

  static SignUpCubit get(context) => BlocProvider.of(context);

  final SignUpUseCase signUpUseCase;

  Future<void> signUp(String name, String phone, String email, String password,
      String confirmPassword) async {
    emit(SignUpLoading());
    final result = await signUpUseCase.call(name: name,
      phone: phone,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );
    result.fold((failure) {
      emit(SignUpError(failure.error));
    }, (data) {
      emit(SignUpSuccess(data),);
    }
    );
  }
}
