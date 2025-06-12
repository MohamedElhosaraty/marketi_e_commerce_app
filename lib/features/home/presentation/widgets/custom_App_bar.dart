import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketi_e_commerce_app/core/helpers/extensions.dart';
import 'package:marketi_e_commerce_app/features/home/presentation/cubit/user_data_cubit/user_data_cubit.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../generated/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataCubit, UserDataState>(
      builder: (context, state) {
        if(state is UserDataSuccess){
          return Row(
            children: [
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
                            imageUrl: state.userData.image,
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
              10.horizontalSpace,
              Text(
                "Hi ${state.userData.name} !",
                style: AppTextStyles.poppins20Medium(
                  context,
                ).copyWith(color: AppColors.darkBlue),
              ),
              Spacer(),
              SvgPicture.asset(
                  Assets.svgNotificationIcon),
            ],
          );
        }
        else if(state is UserDataError){
          return Text(
            state.message,
          );
        }else if (state is UserDataLoading){
          return Row(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 60.h,
                  width: 60.w,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              10.horizontalSpace,

              // shimmer text
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: 120.w,
                  height: 20.h,
                  color: Colors.white,
                ),
              ),
              Spacer(),
              SvgPicture.asset(
                  Assets.svgNotificationIcon),
            ],
          );
        }
        return SizedBox.fromSize();
      },
    );
  }
}
