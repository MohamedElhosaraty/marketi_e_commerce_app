
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial()) {
    pageController = PageController();
  }

  static OnboardingCubit get(context) => BlocProvider.of(context);

  late PageController pageController ;
  int currentIndex = 0;
  void changePage(int index) {
    currentIndex = index;
    emit(ChangeDotState());
  }

  void nextPage() {
    currentIndex++;
    pageController.animateToPage(
      currentIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    emit(NextPageState());

  }
}
