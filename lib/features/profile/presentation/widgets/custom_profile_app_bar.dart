import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/helpers/shared_prefs_keys.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../generated/assets.dart';
import '../../../cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import '../cubit/profile_cubit.dart';

class CustomProfileAppBar extends StatefulWidget {
  const CustomProfileAppBar({super.key});

  @override
  State<CustomProfileAppBar> createState() => _CustomProfileAppBarState();
}

class _CustomProfileAppBarState extends State<CustomProfileAppBar> {
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
              color: context.read<ProfileCubit>().isDarkMode ? AppColors.background : AppColors.darkBlue,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Text(
          "My Profile",
          style: context.read<ProfileCubit>().isDarkMode ?AppTextStyles.poppins20SemiBold(context).copyWith(color: AppColors.background) : AppTextStyles.poppins20SemiBold(
            context,
          ).copyWith(color: AppColors.darkBlue),
        ),
        Stack(
          children: [
            SvgPicture.asset(Assets.svgCart, width: 30.w, height: 30.h),
            Positioned(
              top: -4,
              right: 0,
              child: badges.Badge(
                position: badges.BadgePosition.topEnd(top: -5, end: -5),
                badgeStyle: badges.BadgeStyle(
                  padding: EdgeInsets.all(5.sp),
                  badgeColor: AppColors.primaryColor,
                ),
                badgeContent: Text(
                  context.read<CartCubit>().state.cartList.length.toString(),
                  style: AppTextStyles.poppins10SemiBold(context).copyWith(
                    color: AppColors.background,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
