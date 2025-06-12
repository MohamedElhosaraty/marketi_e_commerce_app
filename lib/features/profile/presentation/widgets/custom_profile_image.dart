import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/helpers/shared_prefs_keys.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../generated/assets.dart';
import '../cubit/profile_cubit.dart';

class CustomProfileImage extends StatefulWidget {
  const CustomProfileImage({super.key});

  @override
  State<CustomProfileImage> createState() => _CustomProfileImageState();
}

class _CustomProfileImageState extends State<CustomProfileImage> {

  String imageUrl = '';
  String userName = '';
  String userEmail = '';


  @override
  void initState() {
    super.initState();
    loadImageUrl();
  }

  Future<void> loadImageUrl() async {
    imageUrl = await SharedPrefHelper.getString(SharedPrefsKeys.saveImageUrl);
    userName = await SharedPrefHelper.getString(SharedPrefsKeys.saveUserName);
    userEmail = await SharedPrefHelper.getString(SharedPrefsKeys.saveUserEmail);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset( context.read<ProfileCubit>().isDarkMode ?
          Assets.imagesProfileShapesDark :
          Assets.imagesProfileShapes,),
        Positioned(
          top: 20.h,
          left: MediaQuery.of(context).size.width / 4,
          child: Container(
              height:120.h,
              width: 120.w,
              decoration: BoxDecoration(
                color: AppColors.background,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.primaryColor, width: 3),
              ),
              child: ClipOval(
                child: Center(
                  child: SizedBox(
                    height: 110.h,
                    width: 110.w,
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.contain,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
              )
          ),
        ),
        Positioned(
          top: 150.h,
          left:  MediaQuery.of(context).size.width / 3.3,
          bottom: 0,
          child: Text(
            userName,
            style: AppTextStyles.poppins18Medium(
              context,
            ).copyWith(color:context.read<ProfileCubit>().isDarkMode ? AppColors.background : AppColors.darkBlue),
          ),
        ),
        Positioned(
          top: 170.h,
          left:  MediaQuery.of(context).size.width / 7.5,
          bottom: 0,
          child: Text(
            userEmail,
            style: AppTextStyles.poppins14Medium(
              context,
            ).copyWith(color: AppColors.grayScale),
          ),
        ),
      ],
    );
  }
}
