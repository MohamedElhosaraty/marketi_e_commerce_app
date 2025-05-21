import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_text_styles.dart';
import '../../../../../generated/assets.dart';

class LoginWithEmail extends StatelessWidget {
  const LoginWithEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Text(
          "Or Continue With",style:
        AppTextStyles.poppins14LightMedium(context).copyWith(
            color: AppColors.navy
        ),) ,
        16.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.imagesGoogleIcon),
            16.horizontalSpace,
            Image.asset(Assets.imagesFacebokIcon),
            16.horizontalSpace,
            Image.asset(Assets.imagesAppleIcon),
          ],
        ),
      ],
    );
  }
}
