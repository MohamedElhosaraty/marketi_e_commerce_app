import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_e_commerce_app/core/di/dependency_injection.dart';
import 'package:marketi_e_commerce_app/core/theming/app_colors.dart';
import 'package:marketi_e_commerce_app/features/home/presentation/widgets/custom_grid_view_all_product.dart';
import 'package:marketi_e_commerce_app/features/home/presentation/widgets/custom_all_app_bar.dart';

import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/widgets/search_field.dart';
import '../cubit/product_cubit/product_cubit.dart';

class AllPopularProduct extends StatelessWidget {
  const AllPopularProduct({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<ProductCubit>()..getProducts(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                14.verticalSpace,
                CustomAllAppBar(
                  title: "Popular Product",
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
                  child: CustomGridViewAllProduct(),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
