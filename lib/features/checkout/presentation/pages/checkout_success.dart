import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketi_e_commerce_app/core/helpers/extensions.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../generated/assets.dart';
import '../../../home/presentation/widgets/custom_all_app_bar.dart';

class CheckoutSuccess extends StatelessWidget {
  const CheckoutSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                14.verticalSpace,
                CustomAllAppBar(title: "Checkout"),
                44.verticalSpace,
                SvgPicture.asset(Assets.svgCheckoutSuccess),
                22.verticalSpace,
                Text(
                  "Tank You!",
                  style: AppTextStyles.poppins24Medium(
                    context,
                  ).copyWith(color: AppColors.darkBlue),
                ),
                30.verticalSpace,
                Text(
                  "Woah, You Have sucessfully orderd ",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.poppins16Medium(
                    context,
                  ).copyWith(color: AppColors.navy),
                ),
                30.verticalSpace,
                CustomButton(
                  onPressed: () {
                    context.pushNamedAndRemoveUntil(Routes.mainScreen, predicate: (route) => false);
                  },
                  text: "Go Home",
                  textStyle: AppTextStyles.poppins18Medium(
                    context,
                  ).copyWith(color: AppColors.background),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
