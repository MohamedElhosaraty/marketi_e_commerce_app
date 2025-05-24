import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_e_commerce_app/features/auth/presentation/cubit/verify_code_cubit/verify_code_cubit.dart';
import 'package:marketi_e_commerce_app/features/auth/presentation/widgets/custom_app_bar.dart';

import '../../../../core/di/dependency_injection.dart';
import '../cubit/send_pass_email_cubit/send_pass_email_cubit.dart';
import '../widgets/verification_code_body.dart';

class VerificationCodeEmail extends StatelessWidget {
  const VerificationCodeEmail({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Verification Code",),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<VerifyCodeCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt <SendPassEmailCubit>(),
          ),
        ],
        child: VerificationCodeBody(
          email: email,
        ),
      ),
    );
  }
}
