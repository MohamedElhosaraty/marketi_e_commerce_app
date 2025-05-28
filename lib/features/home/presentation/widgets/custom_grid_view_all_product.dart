import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_e_commerce_app/core/widgets/custom_grid_view_shimmer.dart';

import '../../../../core/widgets/button_widget.dart';
import '../../../cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import '../cubit/product_cubit/product_cubit.dart';
import 'custom_item.dart';

class CustomGridViewAllProduct extends StatelessWidget {
  const CustomGridViewAllProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductSuccess) {
          return GridView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 20.h,
              childAspectRatio: 0.85,
            ),
            itemCount: state.products.length,
            itemBuilder:
                (context, index) => CustomItem(
                  id: state.products[index].id,
                  image: state.products[index].image[0],
                  title: state.products[index].title,
                  price: state.products[index].price.toString(),
                  discount: state.products[index].discount.toString(),
                  rating: state.products[index].rating.toStringAsFixed(1),
                  addWidget: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      2.verticalSpace,
                      Center(
                        child: ButtonWidget(
                          text: "Add",
                          width: 50.w,
                          height: 6.h,
                          onPressed: () {
                            context
                                .read<CartCubit>()
                                .addToCart(state.products[index].id);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
          );
        } else if (state is ProductError) {
          return Center(child: Text(state.message));
        } else if (state is ProductLoading) {
          return CustomGridViewShimmer();
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
