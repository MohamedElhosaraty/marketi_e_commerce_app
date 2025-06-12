import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_e_commerce_app/core/helpers/extensions.dart';
import 'package:marketi_e_commerce_app/core/helpers/shared_pref_helper.dart';

import '../../../../core/helpers/shared_prefs_keys.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';

class CustomAllAppBar extends StatefulWidget {
  const CustomAllAppBar({super.key, required this.title});

  final String title;

  @override
  State<CustomAllAppBar> createState() => _CustomAllAppBarState();
}

class _CustomAllAppBarState extends State<CustomAllAppBar> {

  late String imageUrl = '';

  @override
  void initState() {
    super.initState();
    loadImageUrl();
  }

  Future<void> loadImageUrl() async {
    imageUrl = await SharedPrefHelper.getString(SharedPrefsKeys.saveImageUrl);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 50.w,
          height: 50.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.rect, width: .5),
          ),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 20,
              color: AppColors.darkBlue,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Text(
          widget.title,
          style: AppTextStyles.poppins20Medium(
            context,
          ).copyWith(color: AppColors.darkBlue),
        ),
        Container(
            height: 60.h,
            width: 60.w,
            decoration: BoxDecoration(
              color: AppColors.background,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primaryColor, width: 3),
            ),
            child: ClipOval(
              child: Center(
                child: SizedBox(
                  height: 50.h,
                  width: 50.w,
                  child: InkWell(
                    onTap: () {
                      context.pushNamed(Routes.profileScreen);
                    },
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.contain,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
              ),
            )
        ),
      ],
    );

  }
}
