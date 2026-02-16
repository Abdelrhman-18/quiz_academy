import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_academy/core/theme/app_colors.dart';

class SubjectCard extends StatelessWidget {
  final String name;
  final int questionsCount;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const SubjectCard({
    super.key,
    required this.name,
    required this.questionsCount,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
          side: BorderSide(color: AppColors.lightGreyColor.withOpacity(0.5)),
        ),
        leading: Container(
          width: 50.w,
          height: 50.h,
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(icon, color: color, size: 28.sp),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: AppColors.darkBlueColor,
          size: 16.sp,
        ),
        title: Text(
          name,
          style: TextStyle(
            color: AppColors.darkBlueColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          "$questionsCount Questions",
          style: TextStyle(
            color: AppColors.greyColor,
            fontSize: 13.sp,
          ),
        ),
      ),
    );
  }
}
