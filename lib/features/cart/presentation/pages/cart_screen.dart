import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_e_commerce_app/core/helpers/extensions.dart';
import 'package:marketi_e_commerce_app/features/cart/presentation/widgets/cart_screen_empty.dart';
import 'package:marketi_e_commerce_app/features/cart/presentation/widgets/list_view_Cart_item.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/utils/enum_state.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../home/presentation/widgets/custom_all_app_bar.dart';
import '../cubit/cart_cubit/cart_cubit.dart';
import '../cubit/cart_cubit/cart_state.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if(state.cartList.isEmpty && state.requestState == RequestState.success){
          return CartScreenEmpty();
        }
        return SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      14.verticalSpace,
                      CustomAllAppBar(title: "Cart"),
                      14.verticalSpace,
                      Text(
                        "Products on Cart",
                        style: AppTextStyles.poppins20SemiBold(
                          context,
                        ).copyWith(color: AppColors.darkBlue),
                      ),
                      14.verticalSpace,
                      Expanded(
                          child: ListViewCartItem()),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(14.0),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  border: Border.symmetric(
                    horizontal: BorderSide(color: AppColors.rect),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Text(
                          "Suptotal (${state.cartList.length} items)",
                          style: AppTextStyles.poppins14SemiBold(
                            context,
                          ).copyWith(color: AppColors.darkBlue),
                        ),
                        Text(
                          "EGP  ${ state.totalPrice.toStringAsFixed(2)}",
                          style: AppTextStyles.poppins14SemiBold(
                            context,
                          ).copyWith(color: AppColors.darkBlue),
                        ),
                      ],
                    ),
                    14.verticalSpace,
                    CustomButton(
                      text: "Checkout",
                      onPressed: () {
                        context.pushNamed(Routes.checkOutScreen ,
                        arguments: state,
                        );
                      },),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
