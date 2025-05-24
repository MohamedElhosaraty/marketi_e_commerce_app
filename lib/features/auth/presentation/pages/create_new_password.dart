import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_e_commerce_app/core/di/dependency_injection.dart';
import 'package:marketi_e_commerce_app/features/auth/presentation/widgets/custom_app_bar.dart';

import '../cubit/create_new_password/create_new_password_cubit.dart';
import '../widgets/create_new_password_body.dart';

class CreateNewPassword extends StatelessWidget {
  const CreateNewPassword({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: 'Create New Password'),
      body: BlocProvider(
        create: (context) => getIt<CreateNewPasswordCubit>(),
        child: CreateNewPasswordBody(
          email: email
        ),
      ),
    );
  }
}
