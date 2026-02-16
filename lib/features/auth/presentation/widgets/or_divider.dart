import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_academy/core/theme/app_colors.dart';

class OrDivider extends StatelessWidget {
  final String text; 
  final Color? color;

  const OrDivider({
    super.key,
    this.text = 'OR', 
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            color: color ?? AppColors.greyColor,
            thickness: 1,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            text,
            style: TextStyle(
              color: color ?? AppColors.greyColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: color ?? AppColors.greyColor,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}