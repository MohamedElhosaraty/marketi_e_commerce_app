import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_e_commerce_app/features/home/domain/usecase/user_data_usecase.dart';

import '../../../../../core/helpers/shared_pref_helper.dart';
import '../../../../../core/helpers/shared_prefs_keys.dart';
import '../../../domain/entity/user_data_entity.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit(this.userDataUseCase) : super(UserDataInitial());

  final UserDataUseCase userDataUseCase;

  Future<void> getUserData() async {
    emit(UserDataLoading());
    final response = await userDataUseCase.getUserData();
    response.fold(
      (l) => emit(UserDataError(l.error)),
      (r) async {
        await SharedPrefHelper.setData(SharedPrefsKeys.saveImageUrl,r.image);

        emit(UserDataSuccess(r));}
    );
  }
}
