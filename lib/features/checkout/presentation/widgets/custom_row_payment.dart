import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';

class CustomRowPayment extends StatelessWidget {
   const CustomRowPayment({super.key, required this.title, required this.price,
    this.isTotal = false});

  final String title;
  final String price;
  final bool isTotal ;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppTextStyles.poppins14Medium(
            context,
          ).copyWith(color:isTotal ? AppColors.darkBlue : AppColors.navy),
        ),
        const Spacer(),
        Text(
          price,
          style: AppTextStyles.poppins14Medium(
            context,
          ).copyWith(color:isTotal ? AppColors.darkBlue : AppColors.navy),
        ),
      ],
    );
  }
}
