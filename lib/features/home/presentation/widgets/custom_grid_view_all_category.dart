import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_e_commerce_app/core/widgets/custom_grid_view_shimmer.dart';
import 'package:marketi_e_commerce_app/features/home/presentation/cubit/category_cubit/category_cubit.dart';
import 'package:marketi_e_commerce_app/features/home/presentation/widgets/custom_category_item.dart';

class CustomGridViewAllCategory extends StatelessWidget {
  const CustomGridViewAllCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit,  CategoryState>(
      builder: (context, state) {
        if (state is CategorySuccess) {
          return GridView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 5.h,
              childAspectRatio: 1.2,
            ),
            itemCount: state.categories.length,
            itemBuilder: (context, index) => CustomCategoryItem(
              categoryEntity: state.categories[index],
            ),
          );
        } else if (state is CategoryError) {
          return Center(child: Text(state.message));
        }else if(state is CategoryLoading){
          return CustomGridViewShimmer();
        }else{
          return SizedBox.shrink();
        }
      },
    );
  }
}
