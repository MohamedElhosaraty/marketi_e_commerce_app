import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketi_e_commerce_app/core/widgets/custom_button.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../generated/assets.dart';
import '../../../home/presentation/widgets/custom_all_app_bar.dart';

class CartScreenEmpty extends StatelessWidget {
  const CartScreenEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            14.verticalSpace,
            CustomAllAppBar(title: "Cart"),
            30.verticalSpace,
            SvgPicture.asset(Assets.svgCartEmpty),
            22.verticalSpace,
            Text(
              "Your cart is empty",
              style: AppTextStyles.poppins24Medium(
                context,
              ).copyWith(color: AppColors.darkBlue),
            ),
            30.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Text(
                "Check our big offers, fresh products and fill your cart with items",
                textAlign: TextAlign.center,style: AppTextStyles.poppins16Medium(
                context,
              ).copyWith(color: AppColors.navy),
              ),
            ),
            42.verticalSpace,
            CustomButton(
                onPressed: () {}, text: "Start Shopping"),
          ],
        ),
      ),
    );
  }
}
