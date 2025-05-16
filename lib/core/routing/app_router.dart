import 'package:flutter/material.dart';
import 'package:marketi_e_commerce_app/core/routing/routes.dart';
import 'package:marketi_e_commerce_app/features/onboarding/presentation/pages/onboarding_screen.dart';

import '../../features/splash/splash_screen.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

    case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

    }
    return null;
  }
}
