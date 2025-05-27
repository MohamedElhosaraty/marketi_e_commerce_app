import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_e_commerce_app/core/theming/app_colors.dart';
import 'package:marketi_e_commerce_app/core/theming/app_text_styles.dart';
import 'package:marketi_e_commerce_app/features/home/domain/entity/category_entity.dart';

class CustomCategoryItem extends StatelessWidget {
  const CustomCategoryItem({super.key, required this.categoryEntity});

  final CategoryEntity categoryEntity;

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
            imageUrl: categoryEntity.imagePath,
            fit: BoxFit.contain,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) =>
                Image.network(
                    "https://th.bing.com/th/id/OIP.z1YPBb4cyu3thtcunO-mSgHaIg?cb=iwp2&rs=1&pid=ImgDetMain"),
          ),
        ),
        Text(
          categoryEntity.name, style: AppTextStyles.poppins16Medium(context).copyWith(
          color: AppColors.darkBlue,
        ),)

      ],
    );
  }
}
