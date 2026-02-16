import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_academy/core/di/di.dart';
import 'package:quiz_academy/features/results_history/presentation/cubit/results_history_cubit.dart';
import 'package:quiz_academy/features/results_history/presentation/cubit/results_history_state.dart';
import 'package:quiz_academy/core/theme/app_colors.dart';
import 'package:intl/intl.dart';

class ResultsHistoryPage extends StatelessWidget {
  const ResultsHistoryPage({super.key});

  // Dynamic colors for subjects
  Color _getSubjectColor(String subject) {
    switch (subject.toLowerCase()) {
      case 'science': return Colors.orange;
      case 'math': return Colors.blue;
      case 'history': return Colors.brown;
      case 'geography': return Colors.green;
      case 'english': return Colors.purple;
      default: return AppColors.primaryColor;
    }
  }

  // Dynamic icons for subjects
  IconData _getSubjectIcon(String subject) {
    switch (subject.toLowerCase()) {
      case 'science': return Icons.science_outlined;
      case 'math': return Icons.calculate_outlined;
      case 'history': return Icons.history_edu_outlined;
      case 'geography': return Icons.public_outlined;
      case 'english': return Icons.language_outlined;
      default: return Icons.quiz_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ResultsHistoryCubit>()..getResults(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FE), // Light background
        appBar: AppBar(
          title: const Text("Results History", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              _buildHeaderStats(),
              SizedBox(height: 25.h),
              Text(
                "Recent Exams",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: AppColors.darkBlueColor),
              ),
              SizedBox(height: 15.h),
              Expanded(
                child: BlocBuilder<ResultsHistoryCubit, ResultsHistoryState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      loading: () => const Center(child: CircularProgressIndicator()),
                      error: (message) => Center(child: Text(message)),
                      success: (examResults) {
                        if (examResults.isEmpty) return _buildEmptyState();

                        return ListView.builder(
                          itemCount: examResults.length,
                          padding: EdgeInsets.only(bottom: 20.h),
                          itemBuilder: (context, index) {
                            final result = examResults[index];
                            final percentage = result.total > 0 ? (result.score / result.total * 100).toInt() : 0;
                            final isPassed = percentage >= 50;

                            return Container(
                              margin: EdgeInsets.only(bottom: 15.h),
                              padding: EdgeInsets.all(16.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.04),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  // Icon
                                  CircleAvatar(
                                    radius: 25.r,
                                    backgroundColor: _getSubjectColor(result.subject).withOpacity(0.1),
                                    child: Icon(_getSubjectIcon(result.subject), color: _getSubjectColor(result.subject)),
                                  ),
                                  SizedBox(width: 15.w),
                                  // Details
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(result.subject, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                                        Text(
                                          DateFormat('MMM dd, yyyy').format(result.date),
                                          style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Score
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "${result.score}/${result.total}",
                                        style: TextStyle(
                                          fontSize: 16.sp, 
                                          fontWeight: FontWeight.bold,
                                          color: isPassed ? Colors.green : Colors.red,
                                        ),
                                      ),
                                      Text("$percentage%", style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      orElse: () => const SizedBox(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderStats() {
    return BlocBuilder<ResultsHistoryCubit, ResultsHistoryState>(
      builder: (context, state) {
        final count = state.maybeWhen(success: (results) => results.length, orElse: () => 0);
        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [Color(0xFF6A5AE0), Color(0xFF9087E5)]),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            children: [
              Text("Total Quizzes Completed", style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 14.sp)),
              SizedBox(height: 5.h),
              Text("$count", style: TextStyle(color: Colors.white, fontSize: 32.sp, fontWeight: FontWeight.bold)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.history_toggle_off, size: 80.sp, color: Colors.grey[300]),
          SizedBox(height: 10.h),
          Text("No records found", style: TextStyle(color: Colors.grey, fontSize: 16.sp)),
        ],
      ),
    );
  }
}