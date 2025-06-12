import 'package:flutter/material.dart';
import 'package:marketi_e_commerce_app/core/routing/routes.dart';
import 'package:marketi_e_commerce_app/features/auth/presentation/pages/congratulations_screen.dart';
import 'package:marketi_e_commerce_app/features/auth/presentation/pages/create_new_password.dart';
import 'package:marketi_e_commerce_app/features/auth/presentation/pages/forgot_password_email.dart';
import 'package:marketi_e_commerce_app/features/auth/presentation/pages/verification_code_email.dart';
import 'package:marketi_e_commerce_app/features/checkout/presentation/pages/checkout_success.dart';
import 'package:marketi_e_commerce_app/features/home/presentation/pages/all_brands.dart';
import 'package:marketi_e_commerce_app/features/home/presentation/pages/all_category.dart';
import 'package:marketi_e_commerce_app/features/home/presentation/pages/all_popular_product.dart';
import 'package:marketi_e_commerce_app/features/main_screen/presentation/main_screen.dart';
import 'package:marketi_e_commerce_app/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:marketi_e_commerce_app/features/profile/presentation/pages/profile_screen.dart';

import '../../features/auth/presentation/pages/login_screen.dart';
import '../../features/auth/presentation/pages/sign_up_screen.dart';
import '../../features/cart/presentation/cubit/cart_cubit/cart_state.dart';
import '../../features/checkout/presentation/pages/checkout_screen.dart';
import '../../features/splash/splash_screen.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

    case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

    case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

    case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

    case Routes.forgetPasswordEmail:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordEmail());

    case Routes.verificationCodeEmail:
        return MaterialPageRoute(builder: (_) =>  VerificationCodeEmail(
          email: settings.arguments as String
        ),);

    case Routes.createNewPassword:
        return MaterialPageRoute(builder: (_) =>  CreateNewPassword(
            email: settings.arguments as String
        ),);

    case Routes.congratulationScreen:
        return MaterialPageRoute(builder: (_) => const CongratulationsScreen(),);

    case Routes.mainScreen:
        return MaterialPageRoute(builder: (_) => const MainScreen(),);


      case Routes.allPopularProducts:
        return MaterialPageRoute(builder: (_) =>  AllPopularProduct(),);


      case Routes.allCategory:
        return MaterialPageRoute(builder: (_) =>  AllCategory(),);



      case Routes.allBrands:
        return MaterialPageRoute(builder: (_) =>  AllBrands(),);

      case Routes.checkOutScreen:
        return MaterialPageRoute(builder: (_) =>  CheckoutScreen(
          cartState:  settings.arguments as CartState,
        ),);

   case Routes.checkoutSuccess:
        return MaterialPageRoute(builder: (_) =>  CheckoutSuccess(),);

   case Routes.profileScreen:
        return MaterialPageRoute(builder: (_) =>  ProfileScreen(),);


    }
    return null;
  }
}
