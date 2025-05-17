import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xFFFFFFFF);
  static const Color primaryColor = Color(0xFF3F80FF);
  static const Color lightBlue700 = Color(0xFFB2CCFF);
  static const Color darkBlue = Color(0xFF001640);
  static const Color navy = Color(0xFF51526C);
  static const Color lightGrey = Color(0xFF929BAB);

  static const Color transparent = Colors.transparent;

  // Optional: Add a method to create a MaterialColor from a single Color
  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }

    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }

    return MaterialColor(color.value, swatch);
  }
}
