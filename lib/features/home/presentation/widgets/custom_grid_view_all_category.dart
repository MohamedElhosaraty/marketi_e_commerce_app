import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_e_commerce_app/features/home/presentation/cubit/category_cubit/category_cubit.dart';
import 'package:marketi_e_commerce_app/features/home/presentation/widgets/custom_category_item.dart';
import 'package:shimmer/shimmer.dart';

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
          return GridView.builder(
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 10.h,
              childAspectRatio: 0.85,
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return  Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Container(
                    width: 160.w,
                    padding: EdgeInsets.only(right: 20.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150.w,
                          height: 96.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                        ),
                        8.verticalSpace,
                        Container(
                          height: 12.h,
                          width: 60.w,
                          color: Colors.white,
                        ),
                        4.verticalSpace,
                        Container(
                          height: 12.h,
                          width: 100.w,
                          color: Colors.white,
                        ),
                        4.verticalSpace,
                        Container(
                          height: 12.h,
                          width: 80.w,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }else{
          return SizedBox.shrink();
        }
      },
    );
  }
}
