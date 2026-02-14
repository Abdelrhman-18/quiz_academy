import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_academy/core/theme/app_colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        title: Text(
          "Profile",
          style: TextStyle(
            color: AppColors.darkBlueColor,
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              // الجزء الخاص بصورة البروفايل والاسم
              Center(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 60.r,
                          backgroundColor: AppColors.primaryColor.withOpacity(0.1),
                          child: Icon(Icons.person, size: 70.sp, color: AppColors.primaryColor),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 18.r,
                            backgroundColor: AppColors.primaryColor,
                            child: Icon(Icons.edit, color: Colors.white, size: 18.sp),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      "Abdelrahman",
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkBlueColor,
                      ),
                    ),
                    Text(
                      "abdelrahman@email.com",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.greyColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatCard("Total Quiz", "24"),
                  _buildStatCard("Avg Score", "85%"),
                ],
              ),
              
              SizedBox(height: 30.h),
              
              _buildProfileOption(Icons.person_outline, "Edit Profile"),
              _buildProfileOption(Icons.security, "Security"),
              _buildProfileOption(Icons.help_outline, "Help Center"),
              
              SizedBox(height: 20.h),
              
              _buildProfileOption(
                Icons.logout, 
                "Logout", 
                textColor: Colors.red, 
                iconColor: Colors.red,
                showArrow: false,
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value) {
    return Container(
      width: 150.w,
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: AppColors.lightGreyColor),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
          Text(
            title,
            style: TextStyle(fontSize: 12.sp, color: AppColors.greyColor),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String title, {Color? textColor, Color? iconColor, bool showArrow = true}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: ListTile(
        onTap: () {},
        leading: Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: (iconColor ?? AppColors.darkBlueColor).withOpacity(0.1),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Icon(icon, color: iconColor ?? AppColors.darkBlueColor, size: 24.sp),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: textColor ?? AppColors.darkBlueColor,
          ),
        ),
        trailing: showArrow ? Icon(Icons.arrow_forward_ios, size: 16.sp, color: AppColors.greyColor) : null,
      ),
    );
  }
}