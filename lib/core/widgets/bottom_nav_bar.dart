import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketi_e_commerce_app/generated/assets.dart';

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
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.rect, width: 2),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
      ),
      child: BottomNavigationBar(
        iconSize: 22,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.svgHomeIcon),
            activeIcon: SvgPicture.asset(
              Assets.svgActiveHomeIcon,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(Assets.svgActiveCartIcon),
            icon: SvgPicture.asset(Assets.svgCartIcon),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.svgFavouriteIcon),
            activeIcon: SvgPicture.asset(Assets.svgActiveFavouriteIcon),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon:  SvgPicture.asset(Assets.svgMenuIcon),
            label: "Menu",
          ),
        ],
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.grayScale,
        selectedLabelStyle: AppTextStyles.poppins12Medium(context),
        unselectedLabelStyle: AppTextStyles.poppins12Medium(context),
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        backgroundColor: AppColors.transparent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
