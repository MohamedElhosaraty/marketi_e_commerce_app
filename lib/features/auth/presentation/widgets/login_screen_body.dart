import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_e_commerce_app/core/api/dio_factory.dart';
import 'package:marketi_e_commerce_app/core/helpers/extensions.dart';
import 'package:marketi_e_commerce_app/core/theming/app_text_styles.dart';
import 'package:marketi_e_commerce_app/core/utils/app_regex.dart';
import 'package:marketi_e_commerce_app/core/widgets/custom_button.dart';
import 'package:marketi_e_commerce_app/core/widgets/custom_text_field.dart';

import '../../../../../core/helpers/toast_helper.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../generated/assets.dart';
import '../cubit/login_cubit/login_cubit.dart';
import 'login_with_email.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  bool isPasswordVisible = false;
  bool isChecked = false;
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasNumber = false;
  bool hasSpecialCharacter = false;
  bool hasMinLength = false;
  bool isEmailValid = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    passwordControllerListener();
    super.initState();
  }

  void passwordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
        hasSpecialCharacter = AppRegex.hasSpecialCharacter(
          passwordController.text,
        );
      });
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Assets.imagesLogoSplashScreen),
                32.verticalSpace,
                CustomTextField(
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !AppRegex.isEmailValid(value)) {
                      return "Please enter a valid email";
                    }
                    return null;
                  },
                  textController: emailController,
                  labelText: "Username or Email",
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: AppColors.darkBlue,
                  ),
                ),
                15.verticalSpace,
                CustomTextField(
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !AppRegex.isPasswordValid(value)) {
                      return "Please enter a valid password";
                    }
                    return null;
                  },

                  textController: passwordController,
                  labelText: "Password",
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: AppColors.darkBlue,
                  ),
                  isObscure: !isPasswordVisible,
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                ),
                6.verticalSpace,
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      activeColor: AppColors.primaryColor,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Text(
                      "Remember Me",
                      style: AppTextStyles.poppins14LightMedium(
                        context,
                      ).copyWith(color: AppColors.navy),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        context.pushNamed(Routes.forgetPasswordEmail);
                      },
                      child: Text(
                        "Forgot Password?",
                        style: AppTextStyles.poppins14Medium(
                          context,
                        ).copyWith(color: AppColors.primaryColor),
                      ),
                    ),
                  ],
                ),
                20.verticalSpace,
                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginError) {
                      ToastHelper().showErrorToast(
                        context,
                        state.message.toString(),
                      );
                    } else if (state is LoginSuccess) {
                      context.pushNamedAndRemoveUntil(
                        Routes.mainScreen,
                        predicate: (route) => false,
                      );
                      DioFactory.setTokenIntoHeaderAfterLogin(state.user.token);
                      ToastHelper().showSuccessToast(
                        context,
                        state.user.message,
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is LoginLoading) {
                      return CustomButton(
                        isLoading: true,
                        onPressed: () {},
                        text: "Log In",
                      );
                    }
                    return CustomButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<LoginCubit>().loginUser(
                            email: emailController.text,
                            password: passwordController.text,
                            rememberMe: isChecked,
                          );
                        } else {
                          return;
                        }
                      },
                      text: "Log In",
                    );
                  },
                ),
                14.verticalSpace,
                LoginWithEmail(),
                15.verticalSpace,
                RichText(
                  text: TextSpan(
                    text: "Are you new in Marketi ",
                    style: AppTextStyles.poppins14LightMedium(
                      context,
                    ).copyWith(color: AppColors.navy),
                    children: [
                      TextSpan(
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                context.pushNamed(Routes.signUpScreen);
                              },
                        text: "register?",
                        style: AppTextStyles.poppins14Medium(
                          context,
                        ).copyWith(color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
