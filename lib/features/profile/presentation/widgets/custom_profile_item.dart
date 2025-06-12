import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../cubit/profile_cubit.dart';

class CustomProfileItem extends StatelessWidget {
  const CustomProfileItem({
    super.key,
    required this.icon,
    required this.title,
    this.isSwitchedIcon = false,
    this.switchValue,
    this.onSwitchChanged,
  });

  final Widget icon;
  final String title;
  final bool isSwitchedIcon;
  final bool? switchValue;
  final ValueChanged<bool>? onSwitchChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        16.horizontalSpace,
        Text(
          title,
          style: context.read<ProfileCubit>().isDarkMode ? AppTextStyles.poppins16Medium(context).copyWith(color: AppColors.background) : AppTextStyles.poppins16Medium(context).copyWith(
            color: AppColors.darkBlue,
          ),
        ),
        const Spacer(),
        isSwitchedIcon
            ? Switch(
          value: switchValue ?? false,
          activeTrackColor: AppColors.primaryColor,
          inactiveTrackColor: AppColors.lightGrey,
          inactiveThumbColor: AppColors.background,
          onChanged: onSwitchChanged,
        )
            : Container(
          width: 28.w,
          height: 28.h,
          decoration: BoxDecoration(
            color:context.read<ProfileCubit>().isDarkMode ? Colors.black : AppColors.background,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.rect, width: .5),
          ),
          child: Icon(
            Icons.arrow_forward_ios_rounded,
            size: 12,
            color: context.read<ProfileCubit>().isDarkMode ? AppColors.background : AppColors.darkBlue,
          ),
        ),
      ],
    );
  }
}
