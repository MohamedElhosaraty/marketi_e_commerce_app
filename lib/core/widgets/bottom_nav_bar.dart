import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../theming/app_colors.dart';
import '../theming/app_text_styles.dart';

class MyBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const MyBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0.h,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: BottomNavigationBar(
        iconSize: 22,
        selectedFontSize:14,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset('AppAssets.homeIcon'),
            activeIcon: SvgPicture.asset(
              'AppAssets.activeHomeIcon',
            ), // Adjust height and width as needed
            // Adjust height and width as needed
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset('AppAssets.activeServiceIcon'),
            icon: SvgPicture.asset('AppAssets.serviceIcon'),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('AppAssets.carIcon'),
            activeIcon: SvgPicture.asset('AppAssets.activeCarIcon'),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.settings),
            label: "Menu",
          ),
        ],
        currentIndex: 1,//context.watch<BottomNavCubit>().state,
        selectedItemColor: AppColors.background,
        unselectedItemColor: AppColors.darkBlue,
        showUnselectedLabels: false,
        selectedLabelStyle: AppTextStyles.poppins22SemiBold(context),
        unselectedLabelStyle: AppTextStyles.poppins22SemiBold(context),
        onTap: onItemTapped,
        backgroundColor: AppColors.transparent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
