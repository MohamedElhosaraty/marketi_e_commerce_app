import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_e_commerce_app/features/home/presentation/cubit/brand_cubit/brand_cubit.dart';
import 'package:marketi_e_commerce_app/features/home/presentation/widgets/custom_brands_item_name.dart';

import '../../../../core/widgets/custom_grid_view_shimmer.dart';

class CustomGridViewAllBrands extends StatelessWidget {
  const CustomGridViewAllBrands({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandCubit, BrandState>(
      builder: (context, state) {
        if (state is BrandSuccess) {
          return GridView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 5.h,
              childAspectRatio: 1.2,
            ),
            itemCount: state.brands.length,
            itemBuilder: (context, index) => CustomBrandsItemName(
              brandEntity: state.brands[index],
            ),
          );
        } else if (state is BrandError) {
          return Center(child: Text(state.message));
        }else if(state is BrandLoading){
          return CustomGridViewShimmer();
        }else{
          return SizedBox.shrink();
        }
      },
    );
  }
}
