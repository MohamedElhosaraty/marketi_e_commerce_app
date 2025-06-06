import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_e_commerce_app/features/favourites/presentation/cubit/favourites_cubit/favourites_cubit.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/widgets/button_widget.dart';
import '../../../cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import '../../../home/presentation/widgets/custom_item.dart';

class CustomGridViewAllFavourites extends StatelessWidget {
  const CustomGridViewAllFavourites({super.key,});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritesCubit, FavouritesState>(
      builder: (context, state) {
        if (state is FavouritesSuccess) {
          return GridView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 20.h,
              childAspectRatio: 0.85,
            ),
            itemCount: state.favourites.length,
            itemBuilder: (context, index) => CustomItem(
              id: state.favourites[index].id.toString(),
              image: state.favourites[index].image[0] ,
              title: state.favourites[index].title,
              price: state.favourites[index].price.toString(),
              discount: state.favourites[index].discount.toString(),
              rating: state.favourites[index].rating.toStringAsFixed(1),
              addWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  2.verticalSpace,
                  Center(
                    child: ButtonWidget(
                      text: "Add",
                      width: 50.w,
                      height: 6.h,
                      onPressed: (){
                        context.read<CartCubit>().addToCart(
                           state.favourites[index].id.toString(),
                        );
                      },
                    ),
                  ),
                ],
              ),

            ),
          );
        } else if (state is FavouritesError) {
          return Center(child: Text(state.message));
        }else if(state is FavouritesLoading){
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
