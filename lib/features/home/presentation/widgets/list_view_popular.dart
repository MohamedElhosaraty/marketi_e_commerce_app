import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_e_commerce_app/core/widgets/custom_item_shimmer.dart';
import 'package:marketi_e_commerce_app/features/home/presentation/cubit/product_cubit/product_cubit.dart';

import '../../../../core/di/dependency_injection.dart';
import '../cubit/add_rate/add_rate_cubit.dart';
import 'custom_item.dart';

class ListViewPopular extends StatelessWidget {
  const ListViewPopular({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: state.products.length,
            itemBuilder: (context, index) =>
                BlocProvider(
                  create: (BuildContext context) => getIt<AddRateCubit>(),
                  child: CustomItem(
                    id: state.products[index].id,
                    image: state.products[index].image[0],
                    title: state.products[index].title,
                    price: state.products[index].price.toString(),
                    discount: state.products[index].discount.toString(),
                    rating: state.products[index].rating.round().toString(),
                  ),
                ),
          );
        } else if (state is ProductError) {
          return Center(child: Text(state.message));
        } else if (state is ProductLoading) {
          return CustomItemShimmer();
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
