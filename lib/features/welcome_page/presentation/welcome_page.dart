import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_academy/core/routes/routes_name.dart';
import 'package:quiz_academy/core/shared_widgets/custm_buttom.dart';
import 'package:quiz_academy/core/theme/app_colors.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/welcome_background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome \nto Quiz Academy!',
                    style: TextStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Test your knowledge and have fun!',
                    style: TextStyle(
                      fontSize: 18.sp, 
                      color: AppColors.whiteColor,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  CustmButtom(
                    title: 'GET STARTED',
                    onPressed: () {
                      context.push( RoutesName.authPage);
                    },
                  ),
                  
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}