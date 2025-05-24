import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_e_commerce_app/core/helpers/extensions.dart';
import 'package:marketi_e_commerce_app/core/helpers/toast_helper.dart';
import 'package:marketi_e_commerce_app/features/auth/presentation/cubit/create_new_password/create_new_password_cubit.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/utils/app_regex.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../generated/assets.dart';
import 'custom_text.dart';

class CreateNewPasswordBody extends StatelessWidget {
  const CreateNewPasswordBody({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Center(
        child: SingleChildScrollView(
          child: BlocConsumer<CreateNewPasswordCubit, CreateNewPasswordState>(
            listener: (context, state) {
              if (state is CreateNewPasswordSuccess) {
                context.pushNamed(Routes.congratulationScreen);
                ToastHelper().showSuccessToast(context, state.message);
              } else if (state is CreateNewPasswordError) {
                ToastHelper().showErrorToast(context, state.message);
              }
            },
            builder: (context, state) {
              CreateNewPasswordCubit cubit =
                  context.read<CreateNewPasswordCubit>();
              return Form(
                autovalidateMode:  AutovalidateMode.onUserInteraction,
                key: cubit.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(Assets.imagesCreateNewPassword),
                    22.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: (40.0)),
                      child: Text(
                        'New password must be different from last password',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.poppins16Medium(
                          context,
                        ).copyWith(color: AppColors.navy),
                      ),
                    ),
                    22.verticalSpace,
                    Align(
                      alignment: Alignment.topLeft,
                      child: CustomText(text: "Email"),
                    ),
                    CustomTextField(
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !AppRegex.isPasswordValid(value)) {
                          return "Please enter a valid password";
                        }
                        return null;
                      },

                      textController: cubit.passwordController,
                      labelText: "Password",
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: AppColors.darkBlue,
                      ),
                      isObscure: cubit.isPasswordVisible,
                      suffixIcon: IconButton(
                        icon: Icon(
                          cubit.isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          cubit.changePasswordVisibility();
                        },
                      ),
                    ),
                    5.verticalSpace,
                    Align(
                      alignment: Alignment.topLeft,
                      child: CustomText(text: "Confirm Password"),
                    ),
                    CustomTextField(
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !AppRegex.isPasswordValid(value)) {
                          return "Please enter a valid password";
                        }
                        return null;
                      },

                      textController: cubit.confirmPasswordController,
                      labelText: "Confirm Password",
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: AppColors.darkBlue,
                      ),
                      isObscure: cubit.isConfirmPasswordVisible,
                      suffixIcon: IconButton(
                        icon: Icon(
                          cubit.isConfirmPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          cubit.changeConfirmPasswordVisibility();
                        },
                      ),
                    ),
                    22.verticalSpace,
                    state is CreateNewPasswordLoading
                        ?  CustomButton(
                          isLoading: true,
                          text: "Save Password",
                          onPressed: () {},
                        )
                        : CustomButton(
                          onPressed: () {
                            if (cubit.formKey.currentState!.validate()) {
                              cubit.createNewPassword(
                                email,
                                cubit.passwordController.text,
                                cubit.confirmPasswordController.text,
                              );
                            }
                          },
                          text: "Save Password",
                        ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
