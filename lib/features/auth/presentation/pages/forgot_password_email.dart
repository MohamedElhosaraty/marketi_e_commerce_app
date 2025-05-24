import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_e_commerce_app/core/di/dependency_injection.dart';
import 'package:marketi_e_commerce_app/features/auth/presentation/cubit/send_pass_email_cubit/send_pass_email_cubit.dart';
import 'package:marketi_e_commerce_app/features/auth/presentation/widgets/custom_app_bar.dart';

import '../widgets/forget_password_email_body.dart';


class ForgotPasswordEmail extends StatelessWidget {
  const ForgotPasswordEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Forgot Password",),
      body: BlocProvider(
        create: (context) => getIt <SendPassEmailCubit>(),
        child: ForgetPasswordEmailBody(),
      ),
    );
  }
}
