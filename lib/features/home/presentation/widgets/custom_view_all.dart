import 'package:flutter/material.dart';
import 'package:marketi_e_commerce_app/core/theming/app_text_styles.dart';

import '../../../../core/theming/app_colors.dart';

class CustomViewAll extends StatelessWidget {
  const CustomViewAll({super.key, required this.title,required this.onPressed});

  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppTextStyles.poppins20SemiBold(
            context,
          ).copyWith(color: AppColors.darkBlue),
        ),
        const Spacer(),
        TextButton(
          onPressed: onPressed,
          child: Text(
            'View All',
            style: AppTextStyles.poppins16Medium(
              context,
            ).copyWith(color: AppColors.primaryColor),
          ),
        ),
      ],
    );
  }
}
