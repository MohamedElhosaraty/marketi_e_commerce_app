import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../generated/assets.dart';
import '../cubit/profile_cubit.dart';
import 'custom_profile_app_bar.dart';
import 'custom_profile_image.dart';
import 'custom_profile_item.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    bool cubit = context.read<ProfileCubit>().isDarkMode;
    return  SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Column(
            children: [
              10.verticalSpace,
              CustomProfileAppBar(),
              30.verticalSpace,
              CustomProfileImage(),
              30.verticalSpace,
              Column(
                children: [
                  CustomProfileItem(
                    icon: Icon(Icons.person_outline, color:cubit ? AppColors.background : AppColors.darkBlue), title: "Account Preferences" ,),
                  Divider(),
                  8.verticalSpace,
                  CustomProfileItem(
                    icon: Icon(Icons.payment, color: cubit ? AppColors.background : AppColors.darkBlue), title: "Subscription & Payment" ,),
                  Divider(),
                  8.verticalSpace,
                  CustomProfileItem(
                    icon: Icon(
                        Icons.notifications_outlined,
                        color: cubit ? AppColors.background : AppColors.darkBlue),
                    title: "App Notifications" ,isSwitchedIcon: true,
                  ),
                  Divider(),
                  8.verticalSpace,
                  CustomProfileItem(
                    icon: Icon(Icons.dark_mode_outlined,
                        color: cubit ? AppColors.background : AppColors.darkBlue),
                    title: "Dark Mode" ,
                    isSwitchedIcon: true,
                    switchValue: context.read<ProfileCubit>().isDarkMode,
                    onSwitchChanged: (val) {
                      context.read<ProfileCubit>().toggleDarkMode(val);
                    },


                  ),
                  Divider(),
                  8.verticalSpace,

                  CustomProfileItem(
                    icon: Icon(Icons.star_border_outlined, color: cubit ? AppColors.background : AppColors.darkBlue), title: "Rate Us" ,),
                  Divider(),
                  8.verticalSpace,

                  CustomProfileItem(
                    icon: Image.asset(Assets.imagesFeedbackIcon , color: cubit ? AppColors.background : AppColors.darkBlue) , title: "Provide Feedback" ,),
                  Divider(),
                  8.verticalSpace,

                  CustomProfileItem(
                    icon: Image.asset(Assets.imagesLogOutIcon), title: "Log out" ,),
                ],)

            ],
          ),
        ),
      ),
    );
  }
}
