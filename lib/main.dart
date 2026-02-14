import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_academy/core/routes/app_routes.dart';

void main() {
  runApp(const QuizAcadamy());
}

class QuizAcadamy extends StatelessWidget {
  const QuizAcadamy({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return child ?? const SizedBox.shrink();
      },
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRoutes.router),
    );
  }
}
