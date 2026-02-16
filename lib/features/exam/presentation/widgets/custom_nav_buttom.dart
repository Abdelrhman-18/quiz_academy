import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_academy/core/theme/app_colors.dart';

class CustomNavButton extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;

  const CustomNavButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.iconColor = AppColors.darkPurpleColor,
    this.backgroundColor = AppColors.whiteColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: 24.sp,
      ),
    );
  }
}