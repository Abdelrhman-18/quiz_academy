import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_academy/core/routes/routes_name.dart';
import 'package:quiz_academy/core/theme/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          "Hello, Abdelerhman",
          style: TextStyle(
            color: AppColors.darkBlueColor,
            fontSize: 18.sp, 
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: CircleAvatar( 
              radius: 20.r,
              backgroundColor: AppColors.primaryColor,
              child: Icon(Icons.person, color: Colors.white, size: 20.sp),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "What do you want to Quiz \ntoday?",
                  style: TextStyle(
                    color: AppColors.darkBlueColor,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20.h), 
                ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: ListTile(
                        onTap: () {
                          context.push(RoutesName.examPage);
                        },
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
                          child: Icon(Icons.science_outlined, color: AppColors.primaryColor, size: 28.sp),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.darkBlueColor,
                          size: 16.sp,
                        ),
                        title: Text(
                          "Science Quiz",
                          style: TextStyle(
                            color: AppColors.darkBlueColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          "10 Questions",
                          style: TextStyle(
                            color: AppColors.greyColor,
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}