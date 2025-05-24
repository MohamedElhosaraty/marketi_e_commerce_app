import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_e_commerce_app/core/helpers/extensions.dart';
import 'package:marketi_e_commerce_app/core/widgets/custom_text_field.dart';
import 'package:marketi_e_commerce_app/features/auth/presentation/cubit/send_pass_email_cubit/send_pass_email_cubit.dart';
import 'package:marketi_e_commerce_app/features/auth/presentation/widgets/custom_text.dart';

import '../../../../core/helpers/toast_helper.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/utils/app_regex.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../generated/assets.dart';

class ForgetPasswordEmailBody extends StatelessWidget {
  const ForgetPasswordEmailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Center(
        child: SingleChildScrollView(
          child: Form(
             autovalidateMode:  AutovalidateMode.onUserInteraction,
            key: context.read<SendPassEmailCubit>().formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                    Assets.imagesForgetPasswordEmail),
                22.verticalSpace,
                Text(
                  'Please enter your email address to receive a verification code',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.poppins16Medium(context).copyWith(
                    color: AppColors.navy,
                  ),
                ),
                22.verticalSpace,
                Align(
                  alignment: Alignment.topLeft,
                  child: CustomText(
                      text: "Email"),
                ),
                CustomTextField(
                  validator: (value) {
                    if (value == null || value.isEmpty ||
                        !AppRegex.isEmailValid(value)) {
                      return "Please enter a valid email";
                    }
                    return null;
                  },
                  textController: context
                      .read<SendPassEmailCubit>()
                      .emailController,
                  labelText: "You@gmail.com",
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: AppColors.darkBlue,
                  ),
                ),
                20.verticalSpace,
                BlocConsumer<SendPassEmailCubit, SendPassEmailState>(
                  listener: (context, state) {
                    if (state is SendPassEmailSuccess) {
                      context.pushNamed(Routes.verificationCodeEmail ,arguments: context.read<SendPassEmailCubit>().emailController.text);
                      ToastHelper().showSuccessToast(context, state.message);
                    } else if (state is SendPassEmailError) {
                      ToastHelper().showErrorToast(context, state.message);
                    }
                  },
                  builder: (context, state) {
                    if(state is SendPassEmailLoading){
                      return CustomButton(
                          isLoading: true,
                          text: "Send Code",onPressed: (){});
                    }
                    return CustomButton(
                      onPressed: () {
                        if(context.read<SendPassEmailCubit>().formKey.currentState!.validate()){
                          context.read<SendPassEmailCubit>().sendPassEmail(
                            context.read<SendPassEmailCubit>().emailController.text
                          );
                        }
                      },
                      text: "Send Code",
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
