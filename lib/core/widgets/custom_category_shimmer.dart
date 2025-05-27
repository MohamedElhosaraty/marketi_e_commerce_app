import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_e_commerce_app/core/theming/app_colors.dart';
import 'package:marketi_e_commerce_app/core/theming/app_text_styles.dart';
import 'package:shimmer/shimmer.dart';

class CustomCategoryShimmer extends StatelessWidget {
  const CustomCategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 96.h,
          width: 105.w,
          child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                height: 96.h,
                width: 105.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
          ),

        SizedBox(height: 8.h),
        Shimmer.fromColors(baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child:
          Text("Pampers",
          style: AppTextStyles.poppins16Medium(context).copyWith(
            color: AppColors.darkBlue,
          ),
        ),),
      ],
    );
  }
}
