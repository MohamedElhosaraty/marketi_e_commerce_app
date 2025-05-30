import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_e_commerce_app/core/theming/app_colors.dart';
import 'package:marketi_e_commerce_app/core/theming/app_text_styles.dart';
import 'package:marketi_e_commerce_app/features/home/domain/entity/brand_entity.dart';

class CustomBrandsItemName extends StatelessWidget {
  const CustomBrandsItemName({super.key, required this.brandEntity});

  final BrandEntity brandEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 96.h,
          width: 105.w,
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(5.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),

          child: CachedNetworkImage(
            imageUrl: brandEntity.imagePath,
            fit: BoxFit.contain,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) =>
                Image.network(
                    "https://finserving.com/wp-content/uploads/2021/06/brand-1068x668.png"),
          ),
        ),
        Text(
          brandEntity.name, style: AppTextStyles.poppins16Medium(context).copyWith(
          color: AppColors.darkBlue,
        ),)

      ],
    );
  }
}
