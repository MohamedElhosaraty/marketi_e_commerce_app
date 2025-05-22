import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_e_commerce_app/core/theming/app_colors.dart';
import 'package:marketi_e_commerce_app/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:marketi_e_commerce_app/features/onboarding/presentation/widgets/onboarding_screen_body.dart';


class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: OnboardingScreenBody(),
      ),
    );
  }
}
