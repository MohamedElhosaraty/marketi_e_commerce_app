import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:marketi_e_commerce_app/features/favourites/presentation/cubit/favourites_cubit/favourites_cubit.dart';
import 'package:marketi_e_commerce_app/features/home/presentation/cubit/add_rate/add_rate_cubit.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({
    super.key,
    this.addWidget,
    this.image,
    this.title,
    this.discount,
    this.price,
    this.rating,
    this.id,
  });

  final Widget? addWidget;
  final String? image, title, discount, price, rating, id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Container(
        padding: const EdgeInsets.only(right: 3.0, left: 3.0),

        width: 160.w,
        margin: EdgeInsets.only(bottom: 2.w),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(5.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 6,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 150.w,
              height: 96.h,
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: AppColors.lightBlue900,
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Stack(
                children: [
                  Center(
                    child: CachedNetworkImage(
                      imageUrl: image ?? "",
                      width: 80.w,
                      height: 60.h,
                      fit: BoxFit.contain,
                      placeholder:
                          (context, url) => const Center(
                            child: CircularProgressIndicator(strokeWidth: 1.5),
                          ),
                      errorWidget:
                          (context, url, error) => Image.network(
                            "https://th.bing.com/th/id/OIP.alXd-7RYIJmDMbrQ9MEs4gHaDp?cb=iwp2&rs=1&pid=ImgDetMain",
                            fit: BoxFit.cover,
                          ),
                    ),
                  ),
                  Container(
                    width: 82.w,
                    color: AppColors.rect,
                    child: Text(
                      discount != null ? '$discount% OFF' : '0% OFF',
                      style: AppTextStyles.poppins12Medium(
                        context,
                      ).copyWith(color: AppColors.darkBlue),
                    ),
                  ),
                  Positioned(
                    right: 4.w,
                    child: CircleAvatar(
                      radius: 14.r,
                      backgroundColor: AppColors.background,
                      child: BlocBuilder<FavouritesCubit, FavouritesState>(
                        builder: (context, state) {
                          final isFav = context
                              .read<FavouritesCubit>()
                              .favouritesList
                              .any((item) => item.id == id);

                          return IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              if (isFav) {
                                context
                                    .read<FavouritesCubit>()
                                    .removeFavourites(id ?? "");
                              } else {
                                context.read<FavouritesCubit>().addToFavourites(
                                  id ?? "",
                                );
                              }
                            },
                            icon: Icon(
                              Icons.favorite,
                              color:
                                  isFav
                                      ? AppColors.primaryColor
                                      : AppColors.darkBlue,
                              size: 20,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            4.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price != null ? '$price LE' : '240 LE',
                  style: AppTextStyles.poppins12Medium(
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
                  onRatingUpdate: (rating) {
                     context
                        .read<AddRateCubit>()
                        .addRate(id ?? "", rating.round().toString());

                  },
                ),
                2.horizontalSpace,
                Text(
                  rating != null ? '$rating' : '4.5',
                  style: AppTextStyles.poppins12Medium(
                    context,
                  ).copyWith(color: AppColors.darkBlue),
                ),
              ],
            ),
            2.verticalSpace,
            Text(
              (title ?? "Iphone").split(" ").take(2).join(" "),
              style: AppTextStyles.poppins12Medium(
                context,
              ).copyWith(color: AppColors.darkBlue),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            addWidget ?? SizedBox.fromSize(),
          ],
        ),
      ),
    );
  }
}
