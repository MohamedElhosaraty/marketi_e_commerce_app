import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';

class CustomBrandsItem extends StatelessWidget {
  const CustomBrandsItem({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  const EdgeInsets.all(12.0),
      margin:  const EdgeInsets.only(right: 16.0),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),

      child: Center(
        child: CachedNetworkImage(
          imageUrl: image,
          width: 80.w,
          height: 60.h,
          fit: BoxFit.contain,
          placeholder: (context, url) =>
              Center(child: CircularProgressIndicator(strokeWidth: 1.5)),
          errorWidget: (context, url, error) => SizedBox(
            width: 80.w,
            height: 60.h,
            child: Image.network(
                "https://finserving.com/wp-content/uploads/2021/06/brand-1068x668.png"
            ),
          ),
        ),
      ),
    );
  }
}
