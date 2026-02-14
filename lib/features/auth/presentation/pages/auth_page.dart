import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_academy/core/routes/routes_name.dart';
import 'package:quiz_academy/core/shared_widgets/custm_buttom.dart';
import 'package:quiz_academy/core/theme/app_colors.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

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
                crossAxisAlignment: .center,
                children: [
                  CustmButtom(
                    title: 'LOGIN',
                    onPressed: () {
                      context.push(RoutesName.loginPage);
                    },
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: .center,
                    children: [
                      Container(
                        width: 100.w,
                        height: 1.h,
                        color: AppColors.greyColor,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        'OR',
                        style: TextStyle(
                          color: AppColors.greyColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Container(
                        width: 100.w,
                        height: 1.h,
                        color: AppColors.greyColor,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),

                  CustmButtom(
                    title: 'CREATE ACCOUNT',
                    onPressed: () {
                      context.push(RoutesName.registerPage);
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
