import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_e_commerce_app/features/cart/domain/entity/cart_entity.dart';
import 'package:marketi_e_commerce_app/features/cart/presentation/cubit/cart_cubit/cart_state.dart';
import 'package:marketi_e_commerce_app/features/favourites/presentation/cubit/favourites_cubit/favourites_cubit.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../cubit/cart_cubit/cart_cubit.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartEntity,required this.cartState});

  final CartEntity cartEntity;
  final CartState cartState ;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: AppColors.background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://d2v5dzhdg4zhx3.cloudfront.net/web-assets/images/storypages/primary/ProductShowcasesampleimages/JPEG/Product+Showcase-1.jpg',
                width: 108.w,
                height: 108.h,
                fit: BoxFit.cover,
              ),
            ),
            8.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        (cartEntity.title).split(" ").take(2).join(" "),
                        style: AppTextStyles.poppins14Medium(
                          context,
                        ).copyWith(color: AppColors.darkBlue),
                      ),
                      Icon(
                        Icons.favorite,
                        color:
                            context.read<FavouritesCubit>().favouritesList.any(
                                  (item) =>
                                      item.id == cartEntity.id,
                                )
                                ? AppColors.primaryColor
                                : AppColors.darkBlue,
                      ),
                    ],
                  ),
                  Text(
                    cartEntity.category,
                    style: AppTextStyles.poppins12Medium(
                      context,
                    ).copyWith(color: AppColors.grayScale),
                  ),
                  8.verticalSpace,
                  Row(
                    children: [
                      Text(
                        "Price:${(cartEntity.price * (1 - cartEntity.discount / 100) * (cartState.productCounts[cartEntity.id] ?? 0)).toStringAsFixed(1)} EGP",
                        style: AppTextStyles.poppins14Medium(
                          context,
                        ).copyWith(color: AppColors.darkBlue),
                      ),
                      Spacer(),
                      RatingBar.builder(
                        itemSize: 20,
                        minRating: 1,
                        allowHalfRating: true,
                        itemCount: 1,
                        itemBuilder:
                            (context, _) =>
                                Icon(Icons.star, color: Color(0xffEF9B26)),
                        onRatingUpdate: (rating) {},
                      ),
                      2.horizontalSpace,
                      Text(
                        cartEntity.rating.toStringAsFixed(1).toString(),
                        style: AppTextStyles.poppins12Medium(
                          context,
                        ).copyWith(color: AppColors.darkBlue),
                      ),
                    ],
                  ),
                  8.verticalSpace,
                   Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 18.r,
                            backgroundColor: AppColors.lightBlue900,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: Icon(
                                Icons.delete_outline,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                context.read<CartCubit>().deleteFromCart(
                                  cartEntity.id,
                                );
                              },
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: 110.w,
                            decoration: BoxDecoration(
                              color: AppColors.lightBlue,
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: Text(
                              (cartState.productCounts[cartEntity.id]  ?? '0').toString(),
                              textAlign: TextAlign.center,
                              style: AppTextStyles.poppins14SemiBold(
                                context,
                              ).copyWith(color: AppColors.primaryColor),
                            ),
                          ),
                          CircleAvatar(
                            radius: 18.r,
                            backgroundColor: AppColors.lightBlue900,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: Icon(
                                Icons.add,
                                color: AppColors.primaryColor,
                              ),
                              onPressed: () {
                                context.read<CartCubit>().incrementProduct(
                                  cartEntity.id,
                                );
                              },
                            ),
                          ),
                        ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
