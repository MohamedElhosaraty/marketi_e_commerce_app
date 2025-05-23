import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_font_families.dart';
import 'app_font_weights.dart';
import 'app_text_size.dart';

class AppTextStyles {
  static const Color textColor =
      AppColors.darkBlue; // Assuming you still need AppColors

  static String getFontFamily(String fontFamily) {

    return fontFamily;
  }

  // Base style to reuse common properties
  static TextStyle baseStyle({
    required String fontFamily,
    required FontWeight fontWeight,
    required double fontSize,
    FontStyle? fontStyle,
    BuildContext? context, // Add context
  }) {

    return TextStyle(
      fontFamily: getFontFamily(fontFamily),
      color: textColor,
      fontWeight: fontWeight,
      fontSize: fontSize,
      fontStyle: fontStyle,
    );
  }

  static TextStyle poppins22SemiBold(BuildContext context) => baseStyle(
    fontFamily: AppFontFamilies.fontFamilyPoppins,
    fontWeight: AppFontWeights.fontWeightSemiBold,
    fontSize: AppTextSizes.fontSize22,
    fontStyle: FontStyle.italic,
    context: context,
  );

  static TextStyle poppins16Medium(BuildContext context) => baseStyle(
    fontFamily: AppFontFamilies.fontFamilyPoppins,
    fontWeight: AppFontWeights.fontWeightMedium,
    fontSize: AppTextSizes.fontSize16,
    fontStyle: FontStyle.italic,
    context: context,
  );
  static TextStyle poppins16LightMedium(BuildContext context) => baseStyle(
    fontFamily: AppFontFamilies.fontFamilyPoppins,
    fontWeight: AppFontWeights.fontWeightLightMedium,
    fontSize: AppTextSizes.fontSize16,
    fontStyle: FontStyle.italic,
    context: context,
  );

  static TextStyle poppins12Medium(BuildContext context) => baseStyle(
    fontFamily: AppFontFamilies.fontFamilyPoppins,
    fontWeight: AppFontWeights.fontWeightMedium,
    fontSize: AppTextSizes.fontSize12,
    fontStyle: FontStyle.italic,
    context: context,
  );
  static TextStyle poppins18Medium(BuildContext context) => baseStyle(
    fontFamily: AppFontFamilies.fontFamilyPoppins,
    fontWeight: AppFontWeights.fontWeightMedium,
    fontSize: AppTextSizes.fontSize18,
    fontStyle: FontStyle.italic,
    context: context,
  );


  static TextStyle poppins14LightMedium(BuildContext context) => baseStyle(
    fontFamily: AppFontFamilies.fontFamilyPoppins,
    fontWeight: AppFontWeights.fontWeightLightMedium,
    fontSize: AppTextSizes.fontSize14,
    fontStyle: FontStyle.italic,
    context: context,
  );

  static TextStyle poppins12LightMedium(BuildContext context) => baseStyle(
    fontFamily: AppFontFamilies.fontFamilyPoppins,
    fontWeight: AppFontWeights.fontWeightLightMedium,
    fontSize: AppTextSizes.fontSize12,
    fontStyle: FontStyle.italic,
    context: context,
  );

  static TextStyle poppins14Medium(BuildContext context) => baseStyle(
    fontFamily: AppFontFamilies.fontFamilyPoppins,
    fontWeight: AppFontWeights.fontWeightMedium,
    fontSize: AppTextSizes.fontSize14,
    fontStyle: FontStyle.italic,
    context: context,
  );

  static TextStyle poppins24Medium(BuildContext context) => baseStyle(
    fontFamily: AppFontFamilies.fontFamilyPoppins,
    fontWeight: AppFontWeights.fontWeightMedium,
    fontSize: AppTextSizes.fontSize24,
    fontStyle: FontStyle.italic,
    context: context,
  );

  static TextStyle poppins20Medium(BuildContext context) => baseStyle(
    fontFamily: AppFontFamilies.fontFamilyPoppins,
    fontWeight: AppFontWeights.fontWeightMedium,
    fontSize: AppTextSizes.fontSize20,
    fontStyle: FontStyle.italic,
    context: context,
  );
  static TextStyle poppins20SemiBold(BuildContext context) => baseStyle(
    fontFamily: AppFontFamilies.fontFamilyPoppins,
    fontWeight: AppFontWeights.fontWeightSemiBold,
    fontSize: AppTextSizes.fontSize20,
    fontStyle: FontStyle.italic,
    context: context,
  );


}
