import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_e_commerce_app/core/widgets/custom_category_shimmer.dart';
import 'package:marketi_e_commerce_app/features/home/presentation/cubit/category_cubit/category_cubit.dart';

import 'custom_category_item.dart';

class GridViewCategory extends StatelessWidget {
  const GridViewCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if(state is CategorySuccess){
          return GridView.builder(
            itemCount: state.categories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 10.h,
              childAspectRatio: 0.75,
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return FadeIn(
                duration: const Duration(milliseconds: 500),
                child: CustomCategoryItem(
                  categoryEntity: state.categories[index],
                ),
              );
            },
          );
        }else if (state is CategoryError) {
          return Center(
            child: Text(state.message),
          );
        }else if (state is CategoryLoading) {
          return GridView.builder(
            itemCount: 6,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 10.h,
              childAspectRatio: 0.75,
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return CustomCategoryShimmer();
            },
          );

        }else{
          return const SizedBox.shrink();
        }
      },
    );
  }
}
