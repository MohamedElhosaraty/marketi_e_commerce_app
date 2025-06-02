import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'features/favourites/presentation/cubit/favourites_cubit/favourites_cubit.dart';

class MarketApp extends StatelessWidget {
  const MarketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
              getIt<FavouritesCubit>()
                ..getFavourites(),
            ),
            BlocProvider(
              create: (context) => getIt<CartCubit>()..getCart(),
            ),
          ],
          child: MaterialApp(
            title: 'MarketApp',
            theme: ThemeData(
              primaryColor: Colors.blue,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
              scaffoldBackgroundColor: Colors.white,
            ),
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.splashScreen,
            onGenerateRoute: AppRouter.generateRoute,
          ),
        ));
  }
}
