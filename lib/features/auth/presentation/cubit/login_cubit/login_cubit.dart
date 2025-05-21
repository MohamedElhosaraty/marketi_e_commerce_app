import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../../../core/helpers/shared_pref_helper.dart';
import '../../../../../../core/helpers/shared_prefs_keys.dart';
import '../../../domain/entity/login_entity.dart';
import '../../../domain/usecase/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUseCase) : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  final LoginUseCase loginUseCase;

  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  Future<void> loginUser({
   required String email,
   required String password,

    bool rememberMe = false,
  }) async {
    emit(LoginLoading());
    final result = await loginUseCase(email, password);
    result.fold((failure) => emit(LoginError(failure.error)), (user) async {
      if (rememberMe) {
        await SharedPrefHelper.setSecuredString(
          SharedPrefsKeys.tokenKey,
          user.token,
        );
      }
      emit(
        LoginSuccess(
          user, // Fixed: was using user.token twice
        ),
      );
    });
  }
}
