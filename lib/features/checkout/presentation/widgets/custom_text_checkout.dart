import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';

class CustomTextCheckout extends StatelessWidget {
  const CustomTextCheckout({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyles.poppins16Medium(
        context,
      ).copyWith(color: AppColors.darkBlue),
    );
  }
}
