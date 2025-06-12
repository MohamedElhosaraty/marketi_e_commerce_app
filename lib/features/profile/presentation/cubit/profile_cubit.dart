
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  bool isDarkMode = false;
  void toggleDarkMode(bool value) {
    isDarkMode = value;
    emit(ProfileDarkMode());
  }
}
