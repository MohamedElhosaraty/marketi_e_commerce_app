import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_e_commerce_app/features/home/presentation/widgets/custom_brands_item.dart';

import '../cubit/brand_cubit/brand_cubit.dart';

class ListViewBrands extends StatelessWidget {
  const ListViewBrands({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandCubit, BrandState>(
      builder: (context, state) {
        if(state is BrandSuccess){
          return ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) => CustomBrandsItem(
              image : state.brands[index].imagePath,
            ),);
        }else if(state is BrandError){
          return Center(child: Text(state.message),);
        }else if(state is BrandLoading){
          return ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) => CircularProgressIndicator(),);
        }else{
          return SizedBox.shrink();
        }
      },
    );
  }
}
