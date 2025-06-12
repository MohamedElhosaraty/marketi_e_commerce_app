import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_e_commerce_app/core/di/dependency_injection.dart';


import '../../../../core/theming/app_colors.dart';
import '../cubit/profile_cubit.dart';
import '../widgets/profile_screen_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileCubit>(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return Scaffold(
              backgroundColor: context
                  .read<ProfileCubit>()
                  .isDarkMode ? Colors.black : AppColors.background,
              body: ProfileScreenBody()
          );
        },
      ),
    );
  }
}
