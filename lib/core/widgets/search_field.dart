import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketi_e_commerce_app/core/theming/app_colors.dart';
import 'package:marketi_e_commerce_app/core/theming/app_text_styles.dart';

import '../../generated/assets.dart';


class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    this.onChanged,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
  });

  final Function(String)? onChanged;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText ?? "Search",
        hintStyle: AppTextStyles.poppins16LightMedium(context).copyWith(
          color: AppColors.placeHolder,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide:  BorderSide(color: AppColors.rect),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide:  BorderSide(color: AppColors.rect),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide:  BorderSide(color: AppColors.rect),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide:  BorderSide(color: AppColors.rect),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        prefixIcon: prefixIcon ??
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SvgPicture.asset(
                Assets.svgSearchIcon,
                width: 24,
                height: 24,
              ),
            ),
        suffixIcon: suffixIcon ??
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SvgPicture.asset(
                Assets.svgFilterIcon,
                width: 24,
                height: 24,
              ),
            ),
      ),
    );
  }
}
