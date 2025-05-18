import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_colors.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color color;
  final Color textColor;
  final double width;
  final double height;
  final double fontSize;
  final FontWeight fontWeight;
  const ButtonWidget({
    super.key,
    required this.fontWeight,
    required this.text,
    required this.color,
    required this.textColor,
    required this.width,
    required this.height,
    required this.fontSize,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(
          horizontal: width.sp,
          vertical: height.sp,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.sp),
          side: BorderSide(
            color: AppColors.transparent,
            width: 1.5.sp,
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize.sp,
          fontFamily: 'Poppins',
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
