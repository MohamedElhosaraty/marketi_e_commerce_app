import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_e_commerce_app/core/helpers/extensions.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../generated/assets.dart';

class CongratulationsScreenBody extends StatelessWidget {
  const CongratulationsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            44.verticalSpace,
            Image.asset(Assets.imagesCongratulations),
            22.verticalSpace,
            Text(
              'Congratulations',
              textAlign: TextAlign.center,
              style: AppTextStyles.poppins24Medium(
                context,
              ).copyWith(color: AppColors.darkBlue),
            ),
            30.verticalSpace,
            Text(
              'You have updated the password. please login again with your latest password',
              textAlign: TextAlign.center,
              style: AppTextStyles.poppins16Medium(
                context,
              ).copyWith(color: AppColors.navy),
            ),
            30.verticalSpace,
            CustomButton(
              text: "Log In",
              onPressed: () {
                context.pushNamedAndRemoveUntil(
                  Routes.loginScreen,
                  predicate: (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
