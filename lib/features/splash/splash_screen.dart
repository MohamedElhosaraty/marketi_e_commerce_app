import 'dart:async';

import 'package:flutter/material.dart';
import 'package:marketi_e_commerce_app/core/helpers/extensions.dart';
import 'package:marketi_e_commerce_app/core/helpers/shared_pref_helper.dart';
import 'package:marketi_e_commerce_app/generated/assets.dart';

import '../../core/helpers/shared_prefs_keys.dart';
import '../../core/routing/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () async {
      final token = await SharedPrefHelper.getSecuredString(SharedPrefsKeys.tokenKey);

      if (token != null && token.isNotEmpty) {
        context.pushReplacementNamed(Routes.mainScreen);
      } else {
        context.pushReplacementNamed(Routes.onBoardingScreen);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset(Assets.imagesLogoSplashScreen)),
    );
  }
}
