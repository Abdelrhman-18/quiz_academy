import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_academy/core/routes/routes_name.dart';
import 'package:quiz_academy/features/exam/presentation/widgets/custom_nav_buttom.dart';
import 'package:quiz_academy/features/home/domain/entities/subject_model.dart';

class ShowAnswersPage extends StatefulWidget {
  final SubjectModel subject;
  final List<int?> userAnswers;

  const ShowAnswersPage({
    super.key,
    required this.subject,
    required this.userAnswers,
  });

  @override
  State<ShowAnswersPage> createState() => _ShowAnswersPageState();
}

class _ShowAnswersPageState extends State<ShowAnswersPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.subject.questions[currentIndex];
    final String correctAnswer = currentQuestion.answer;
    final int? userSelectedIndex = widget.userAnswers[currentIndex];

    return Scaffold(
      backgroundColor: const Color(0xFF4B3587),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        centerTitle: true,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white30, width: 1.5),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Text(
            "Review: ${currentIndex + 1}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Text(
              "Question ${currentIndex + 1} of ${widget.subject.questions.length}",
              style: TextStyle(color: Colors.white70, fontSize: 14.sp),
            ),
            SizedBox(height: 10.h),
            Text(
              currentQuestion.question,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30.h),
            Expanded(
              child: ListView.builder(
                itemCount: currentQuestion.options.length,
                itemBuilder: (context, index) {
                  String option = currentQuestion.options[index];
                  Color borderColor = Colors.transparent;
                  Widget? trailingIcon;

                  if (option == correctAnswer) {
                    borderColor = Colors.green;
                    trailingIcon = const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    );
                  } else if (userSelectedIndex == index &&
                      option != correctAnswer) {
                    borderColor = Colors.red;
                    trailingIcon = const Icon(Icons.cancel, color: Colors.red);
                  }

                  return Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: Container(
                      width: double.infinity,
                      height: 60.h,
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.r),
                        border: Border.all(color: borderColor, width: 2.5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              option,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          if (trailingIcon != null) trailingIcon,
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                currentIndex > 0
                    ? CustomNavButton(
                        icon: Icons.arrow_back,
                        onTap: () {
                          setState(() => currentIndex--);
                        },
                      )
                    : const SizedBox.shrink(),
                CustomNavButton(
                  icon: currentIndex == widget.subject.questions.length - 1
                      ? Icons.done_all
                      : Icons.arrow_forward,
                  onTap: () {
                    if (currentIndex < widget.subject.questions.length - 1) {
                      setState(() => currentIndex++);
                    } else {
                      context.push( RoutesName.bottomNavigationBar);
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
