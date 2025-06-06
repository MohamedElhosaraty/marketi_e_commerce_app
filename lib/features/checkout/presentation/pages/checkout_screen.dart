import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_e_commerce_app/core/helpers/extensions.dart';
import 'package:marketi_e_commerce_app/core/widgets/custom_button.dart';
import 'package:marketi_e_commerce_app/core/widgets/custom_text_field.dart';
import 'package:marketi_e_commerce_app/features/checkout/presentation/widgets/custom_row_payment.dart';
import 'package:marketi_e_commerce_app/features/checkout/presentation/widgets/custom_text_checkout.dart';
import 'package:marketi_e_commerce_app/features/home/presentation/widgets/custom_all_app_bar.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../generated/assets.dart';
import '../../../cart/presentation/cubit/cart_cubit/cart_state.dart';
import '../../cubit/checkout__cubit.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key, required this.cartState,});

  final CartState cartState;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CheckoutCubit>(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  14.verticalSpace,
                  CustomAllAppBar(title: "Checkout"),
                  12.verticalSpace,
                  CustomTextCheckout(text: "Address"),
                  12.verticalSpace,
                  Builder(
                    builder: (context) {
                      return InkWell(
                          onTap: () {
                            context.read<CheckoutCubit>().openCurrentLocationOnMap();
                          }, child: Image.asset(Assets.imagesMap));
                    }
                  ),
                  12.verticalSpace,
                  CustomTextCheckout(text: "Delivery Time"),
                  12.verticalSpace,
                  CustomTextField(
                    labelText: "Within 2 days",
                    prefixIcon: Icon(
                        Icons.train_outlined, color: AppColors.darkBlue),
                  ),
                  12.verticalSpace,
                  CustomTextCheckout(text: "Payment"),
                  12.verticalSpace,
                  CustomTextField(
                    labelText: "Cash on Delivery",
                    prefixIcon: Icon(
                      Icons.payments_outlined,
                      color: AppColors.darkBlue,
                    ),
                    suffixIcon: Text(
                      "Change",
                      style: AppTextStyles.poppins14Medium(
                        context,
                      ).copyWith(color: AppColors.primaryColor),
                    ),
                  ),
                  12.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: CustomTextField(
                          labelText: "Voucher code",
                        ),
                      ),
                      14.horizontalSpace,
                      Expanded(
                        child: CustomButton(

                          bgColor: AppColors.background,
                          onPressed: () {},
                          text: "Apply",
                          textStyle: AppTextStyles.poppins14Medium(
                            context,
                          ).copyWith(color: AppColors.primaryColor),
                        ),
                      ),
                    ],
                  ),
                  12.verticalSpace,
                  CustomTextCheckout(text: "Payment"),
                  12.verticalSpace,
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.rect, width: 2),
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: Column(
                      children: [
                        CustomRowPayment(
                          title: 'Suptotal (${cartState.cartList.length} items)',
                          price: 'EGP ${cartState.totalPrice.toStringAsFixed(
                              2)}',),
                        6.verticalSpace,
                        CustomRowPayment(
                          title: 'Delivery Fees',
                          price: 'EGP 10.00',),
                        3.verticalSpace,
                        Divider(),
                        3.verticalSpace,
                        CustomRowPayment(
                          isTotal: true,
                          title: 'Total',
                          price: 'EGP ${(cartState.totalPrice + 10)
                              .toStringAsFixed(2)}',),
                      ],
                    ),
                  ),
                  12.verticalSpace,
                  CustomButton(
                    onPressed: () {
                      context.pushReplacementNamed(Routes.checkoutSuccess);
                    },
                    text: "Place Order",
                    textStyle: AppTextStyles.poppins18Medium(
                      context,
                    ).copyWith(color: AppColors.background),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
