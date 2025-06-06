import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/widgets/search_field.dart';
import '../../../home/presentation/widgets/custom_all_app_bar.dart';
import '../widgets/custom_grid_view_all_favourites.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            14.verticalSpace,
            CustomAllAppBar(
              title: "Favourites",
            ),
            14.verticalSpace,
            SearchField(
                hintText: "What are you looking for ? "),
            14.verticalSpace,
            Text(
              "All Products",
              style: AppTextStyles.poppins20SemiBold(context).copyWith(
                color: AppColors.darkBlue,
              ),
            ),
            14.verticalSpace,
            Expanded(
              child: CustomGridViewAllFavourites(),
            ),

          ],
        ),
      ),
    );
  }
}
