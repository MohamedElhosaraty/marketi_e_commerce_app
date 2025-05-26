import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_e_commerce_app/core/helpers/extensions.dart';
import 'package:marketi_e_commerce_app/core/widgets/search_field.dart';
import 'package:marketi_e_commerce_app/features/home/presentation/widgets/List_view_best_for_you.dart';
import 'package:marketi_e_commerce_app/features/home/presentation/widgets/custom_App_bar.dart';
import 'package:marketi_e_commerce_app/features/home/presentation/widgets/custom_view_all.dart';
import 'package:marketi_e_commerce_app/features/home/presentation/widgets/grid_view_category.dart';
import 'package:marketi_e_commerce_app/features/home/presentation/widgets/list_view_brands.dart';
import 'package:marketi_e_commerce_app/features/home/presentation/widgets/list_view_buy_again.dart';
import 'package:marketi_e_commerce_app/features/home/presentation/widgets/list_view_popular.dart';

import '../../../../core/routing/routes.dart';
import '../../../../generated/assets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              14.verticalSpace,
              CustomAppBar(),
              14.verticalSpace,
              SearchField(hintText: "What are you looking for ? "),
              14.verticalSpace,
              Image.asset(Assets.imagesOffer),
              14.verticalSpace,
              CustomViewAll(
                onPressed: (){
                  context.pushNamed(Routes.allPopularProducts);
                },
                  title: "Popular Product"),
              8.verticalSpace,
              SizedBox(
                  height: 150.h,
                  child: ListViewPopular()),
              CustomViewAll(
                  onPressed: (){
                    context.pushNamed(Routes.allCategory);
                  },
                  title: "Category"),
              8.verticalSpace,
              GridViewCategory(),
              CustomViewAll(
                  onPressed: (){},
                  title: "Best for you"),
              SizedBox(
                  height: 200.h,
                  child: ListViewBestForYou()),
              10.verticalSpace,
              CustomViewAll(
                  onPressed: (){
                    context.pushNamed(Routes.allBrands);
                  },
                  title: "Brands"),
              SizedBox(
                  height: 100.h,
                  child: ListViewBrands()),
              14.verticalSpace,
              CustomViewAll(
                  onPressed: (){},
                  title: "Buy Again"),
              8.verticalSpace,
              SizedBox(
                  height: 200.h,
                  child: ListViewBuyAgain()),
              8.verticalSpace,


            ],
          ),
        ),
      ),
    );
  }
}
