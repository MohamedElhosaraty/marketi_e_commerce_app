import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_e_commerce_app/core/helpers/extensions.dart';
import 'package:marketi_e_commerce_app/core/routing/routes.dart';
import 'package:marketi_e_commerce_app/features/auth/presentation/cubit/verify_code_cubit/verify_code_cubit.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../core/helpers/toast_helper.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../generated/assets.dart';
import '../cubit/send_pass_email_cubit/send_pass_email_cubit.dart';

class VerificationCodeBody extends StatefulWidget {
  const VerificationCodeBody({super.key, required this.email});

  final String email;

  @override
  State<VerificationCodeBody> createState() => _VerificationCodeBodyState();
}

class _VerificationCodeBodyState extends State<VerificationCodeBody> {

  final TextEditingController _otpController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late Timer _timer;
  int _start = 60;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _start = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    if (mounted) {
      _timer.cancel();

      _otpController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                    Assets.imagesVerificationCode),
                22.verticalSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 56.0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Please enter the 4 digit code sent to: ",
                      style: AppTextStyles.poppins16Medium(
                        context,
                      ).copyWith(color: AppColors.navy),
                      children: [
                        TextSpan(
                          text: widget.email,
                          style: AppTextStyles.poppins16Medium(
                            context,
                          ).copyWith(color: AppColors.lightBlue700),
                        ),
                      ],
                    ),
                  ),
                ),
                22.verticalSpace,
                PinCodeTextField(
                  appContext: context,
                  length: 6,
                  controller: _otpController,
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.scale,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    inactiveColor: AppColors.rect,
                    activeColor: AppColors.rect,
                    selectedColor: AppColors.rect,
                  ),
                ),
                20.verticalSpace,
                BlocConsumer<VerifyCodeCubit, VerifyCodeState>(
                  listener: (context, state) {
                    if (state is VerifyCodeSuccess) {
                      ToastHelper().showSuccessToast(context, state.message);
                      context.pushNamed(Routes.createNewPassword,
                          arguments: widget.email);
                    }else if (state is VerifyCodeError) {
                      ToastHelper().showErrorToast(context, state.message);

                    }
                  },
                  builder: (context, state) {
                    if(state is VerifyCodeLoading){
                      return CustomButton(
                        isLoading: true,
                        onPressed: () {},
                        text: "Verify Code",
                      );
                    }
                    return CustomButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<VerifyCodeCubit>().verifyCode(widget.email, _otpController.text);
                        } else {
                          return;
                        }
                      },
                      text: "Verify Code",
                    );
                  },
                ),
                22.verticalSpace,
                Text(
                  _start > 0 ? "0:${_start.toString().padLeft(2, '0')}" : "00:00",
                  style: AppTextStyles.poppins16Medium(context),
                ),
                22.verticalSpace,
                InkWell(
                  onTap: () {
                    startTimer();
                    context.read<SendPassEmailCubit>().sendPassEmail(
                       widget.email,
                    );
                  },
                  child: Text(
                    "Resend Code",
                    style: AppTextStyles.poppins16Medium(context).copyWith(
                      color: AppColors.navy,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
