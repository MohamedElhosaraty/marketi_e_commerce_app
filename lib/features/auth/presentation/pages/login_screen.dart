import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_e_commerce_app/core/di/dependency_injection.dart';

import '../cubit/login_cubit/login_cubit.dart';
import '../widgets/login_screen_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<LoginCubit>(),
        child: LoginScreenBody(),
      ),
    );
  }
}
