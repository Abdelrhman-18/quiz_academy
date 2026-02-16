import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_academy/core/routes/routes_name.dart';
import 'package:quiz_academy/core/shared_widgets/custm_buttom.dart';

class ResultPage extends StatelessWidget {
  final Map<String, dynamic> resultData;

  const ResultPage({super.key, required this.resultData});

  @override
  Widget build(BuildContext context) {
    final int score = resultData['score'] ?? 0;
    final int total = resultData['total'] ?? 0;
    final double percentage = (score / total) * 100;

    return Scaffold(
      backgroundColor: const Color(0xFF4B3587),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              percentage >= 50 ? "Congratulations!" : "Keep Trying!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              percentage >= 50
                  ? "You passed the exam successfully"
                  : "You can do better next time",
              style: TextStyle(color: Colors.white70, fontSize: 16.sp),
            ),
            SizedBox(height: 50.h),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 200.r,
                  height: 200.r,
                  child: CircularProgressIndicator(
                    value: score / total,
                    strokeWidth: 12,
                    backgroundColor: Colors.white10,
                    color: percentage >= 50
                        ? Colors.greenAccent
                        : Colors.orangeAccent,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "$score/$total",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${percentage.toInt()}%",
                      style: TextStyle(color: Colors.white70, fontSize: 20.sp),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 60.h),
            CustmButtom(
              onPressed: () => context.go(RoutesName.bottomNavigationBar),
              title: "Back to Home",
            ),

            SizedBox(height: 15.h),
            TextButton(
              onPressed: () => context.go(RoutesName.showAnswersPage, extra: {
                'subject': resultData['subject'],
                'userAnswers': resultData['userAnswers'],
              }),
              child: Text(
                "Show Answers",
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
