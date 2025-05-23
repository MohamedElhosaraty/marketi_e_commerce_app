import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_e_commerce_app/core/helpers/extensions.dart';
import 'package:marketi_e_commerce_app/core/helpers/toast_helper.dart';
import 'package:marketi_e_commerce_app/features/auth/presentation/widgets/login_with_email.dart';
import 'package:marketi_e_commerce_app/features/auth/presentation/widgets/sign_up_text_field.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/assets.dart';
import '../../../../core/routing/routes.dart';
import '../cubit/sign_up_cubit/sign_up_cubit.dart';

class SignUpScreenBody extends StatefulWidget {
  const SignUpScreenBody({super.key});

  @override
  State<SignUpScreenBody> createState() => _SignUpScreenBodyState();
}

class _SignUpScreenBodyState extends State<SignUpScreenBody> {


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String name , phone , email , password , confirmPassword;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                Image.asset(Assets.imagesLogoSignUp),
                SignUpTextField(
                  onNameChanged: (value) {
                    name = value;
                  },
                  onPhoneNumberChanged: (value) {
                    phone = value;
                  },
                  onEmailChanged: (value) {
                    email = value;
                  },
                  onPasswordChanged: (value) {
                    password = value;
                  },
                  onConfirmPasswordChanged: (value) {
                    confirmPassword = value;
                  },

                ),
                14.verticalSpace,
                BlocConsumer<SignUpCubit, SignUpState>(
                  listener: (context, state) {
                    if (state is SignUpSuccess) {
                      context.pushNamedAndRemoveUntil(Routes.loginScreen, predicate: (route) => false);
                      ToastHelper().showSuccessToast(context, state.signUpEntity.message);
                    }else if (state is SignUpError) {
                      ToastHelper().showErrorToast(context, state.errorMessage);

                    }
                  },
                  builder: (context, state) {
                    if(state is SignUpLoading){
                      return CustomButton(
                        isLoading: true,
                        onPressed: () {},
                        text: "Sign Up",
                      );
                    }
                    return CustomButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<SignUpCubit>().signUp(name, phone, email, password, confirmPassword);
                        } else {
                          return;
                        }
                      },
                      text: "Sign Up",
                    );
                  },
                ),
                14.verticalSpace,
                LoginWithEmail(),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
