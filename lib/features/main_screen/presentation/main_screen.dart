import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_e_commerce_app/core/di/dependency_injection.dart';
import 'package:marketi_e_commerce_app/features/cart/presentation/pages/cart_screen.dart';
import 'package:marketi_e_commerce_app/features/favourites/presentation/pages/favourites_screen.dart';
import 'package:marketi_e_commerce_app/features/home/presentation/cubit/category_cubit/category_cubit.dart';
import 'package:marketi_e_commerce_app/features/home/presentation/cubit/user_data_cubit/user_data_cubit.dart';
import 'package:marketi_e_commerce_app/features/home/presentation/pages/home_screen.dart';
import 'package:marketi_e_commerce_app/features/menu/presentation/pages/menu_screen.dart';

import '../../../core/widgets/bottom_nav_bar.dart';
import '../../favourites/presentation/cubit/favourites_cubit/favourites_cubit.dart';
import '../../home/presentation/cubit/brand_cubit/brand_cubit.dart';
import '../../home/presentation/cubit/product_cubit/product_cubit.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    CartScreen(),
    FavouritesScreen(),
    MenuScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          getIt<UserDataCubit>()
            ..getUserData(),
        ),
        BlocProvider(
          create: (context) => getIt<ProductCubit>()..getProducts(),
        ),
        BlocProvider(
          create: (context) => getIt<CategoryCubit>()..getCategories(),
        ),
        BlocProvider(
          create: (context) => getIt<BrandCubit>()..getBrands(),
        ),
      ],
      child: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: MyBottomNavBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onTabTapped,
        ),

      ),
    );
  }
}
