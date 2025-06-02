import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_e_commerce_app/core/widgets/custom_cart_item_shimmer.dart';
import 'package:marketi_e_commerce_app/features/cart/presentation/widgets/Cart_item.dart';

import '../../../../core/utils/enum_state.dart';
import '../cubit/cart_cubit/cart_cubit.dart';
import '../cubit/cart_cubit/cart_state.dart';

class ListViewCartItem extends StatelessWidget {
  const ListViewCartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state.requestState == RequestState.loading) {
          return const CustomCartItemShimmer();
        } else if (state.requestState == RequestState.error) {
          return Center(child: Text(state.message.isNotEmpty ? state.message : "Error"));
        } else if (state.requestState == RequestState.success) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: state.cartList.length,
            itemBuilder: (context, index) => CartItem(
              cartEntity: state.cartList[index],
              cartState: state,
            ),
          );
        }
        // fallback UI (can be empty)
        return const SizedBox.shrink();
      },
    );
  }
}
