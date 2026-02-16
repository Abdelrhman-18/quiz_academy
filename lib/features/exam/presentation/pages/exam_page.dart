import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_academy/core/database/cache_helper.dart';
import 'package:quiz_academy/core/di/di.dart';
import 'package:quiz_academy/core/routes/routes_name.dart';
import 'package:quiz_academy/core/theme/app_colors.dart';
import 'package:quiz_academy/core/utils/snackbar_helper.dart';
import 'package:quiz_academy/features/exam/presentation/cubit/exam_cubit.dart';
import 'package:quiz_academy/features/exam/presentation/cubit/exam_state.dart';
import 'package:quiz_academy/features/exam/presentation/widgets/custom_nav_buttom.dart';
import 'package:quiz_academy/features/home/domain/entities/subject_model.dart';

class ExamPage extends StatefulWidget {
  final SubjectModel subject;
  const ExamPage({super.key, required this.subject});

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  int currentIndex = 0;
  late List<int?> userAnswers;

  @override
  void initState() {
    super.initState();
    userAnswers = List<int?>.filled(widget.subject.questions.length, null);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ExamCubit>()..startTimer(),
      child: BlocListener<ExamCubit, ExamState>(
        listener: (context, state) {
          final score = context.read<ExamCubit>().calculateScore(
                widget.subject,
                userAnswers,
              );
          state.maybeWhen(
            saveExamResult: (subjectName) {
              context.push(
                RoutesName.resultPage,
                extra: {
                  'score': score,
                  'total': widget.subject.questions.length,
                  'subject': widget.subject,
                  'userAnswers': userAnswers,
                },
              );
            },
            error: (message) {
              SnackBarHelper.showError(context, message);
            },
            orElse: () {},
          );
        },
        child: Scaffold(
          backgroundColor: AppColors.darkPurpleColor,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.close, color: AppColors.whiteColor),
              onPressed: () async {
                final shouldExit = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                      'Exit Exam?',
                      style: TextStyle(color: AppColors.darkBlueColor),
                    ),
                    content: const Text(
                      'Your progress will be lost. Are you sure you want to exit?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => context.pop(false),
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: AppColors.greyColor),
                        ),
                      ),
                      TextButton(
                        onPressed: () => context.pop(true),
                        child: Text(
                          'Exit',
                          style: TextStyle(color: AppColors.redColor),
                        ),
                      ),
                    ],
                  ),
                );

                if (shouldExit == true && context.mounted) {
                  context.pop();
                }
              },
            ),
            centerTitle: true,
            title: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.blueAccentColor, width: 2),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                "${currentIndex + 1}",
                style: TextStyle(color: AppColors.whiteColor, fontSize: 16.sp),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 15.w),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: BlocBuilder<ExamCubit, ExamState>(
                      builder: (context, state) {
                        int time = state.maybeWhen(
                          timerRunInProgress: (remainingTime) => remainingTime,
                          orElse: () => 600,
                        );
                        return Row(
                          children: [
                            Text(
                              context.read<ExamCubit>().formatTime(time),
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 14.sp,
                              ),
                            ),
                            SizedBox(width: 5.w),
                            const Icon(
                              Icons.timer,
                              color: AppColors.orangeColor,
                              size: 18,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.h),
                Text(
                  "Question ${currentIndex + 1} of ${widget.subject.questions.length}",
                  style: TextStyle(color: AppColors.lightGreyColor, fontSize: 16.sp),
                ),
                SizedBox(height: 20.h),
                Text(
                  widget.subject.questions[currentIndex].question,
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40.h),
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.subject.questions[currentIndex].options.length,
                    itemBuilder: (context, index) {
                      String option = widget.subject.questions[currentIndex].options[index];
                      bool isSelected = userAnswers[currentIndex] == index;
                      return Padding(
                        padding: EdgeInsets.only(bottom: 15.h),
                        child: InkWell(
                          onTap: () => setState(() => userAnswers[currentIndex] = index),
                          borderRadius: BorderRadius.circular(25.r),
                          child: Container(
                            width: double.infinity,
                            height: 65.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(25.r),
                              border: Border.all(
                                color: isSelected ? AppColors.greenColor : AppColors.whiteColor.withOpacity(0),
                                width: 3,
                              ),
                            ),
                            child: Text(
                              option,
                              style: TextStyle(
                                color: AppColors.blackColor,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
                            onTap: () => setState(() => currentIndex--),
                          )
                        : const SizedBox.shrink(),
                    Builder(builder: (btnContext) {
                      bool isSelected = userAnswers[currentIndex] != null;
                      return CustomNavButton(
                        icon: currentIndex == widget.subject.questions.length - 1
                            ? Icons.check
                            : Icons.arrow_forward,
                        backgroundColor: isSelected ? AppColors.whiteColor : AppColors.greyColor,
                        onTap: !isSelected
                            ? null
                            : () {
                                if (currentIndex < widget.subject.questions.length - 1) {
                                  setState(() => currentIndex++);
                                } else {
                                  final userId = CacheHelper.getData(key: "uId");
                                  if (userId != null && userId != 0) {
                                    final cubit = btnContext.read<ExamCubit>();
                                    cubit.submitExam(
                                      userId: userId,
                                      score: cubit.calculateScore(widget.subject, userAnswers),
                                      total: widget.subject.questions.length,
                                      subject: widget.subject.name,
                                    );
                                  } else {
                                    SnackBarHelper.showError(
                                      context, 
                                      "User session invalid. Please login again."
                                    );
                                  }
                                }
                              },
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}