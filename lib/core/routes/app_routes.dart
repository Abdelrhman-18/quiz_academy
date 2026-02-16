import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_academy/core/database/cache_helper.dart';
import 'package:quiz_academy/core/routes/routes_name.dart';
import 'package:quiz_academy/features/auth/presentation/pages/auth_page.dart';
import 'package:quiz_academy/features/auth/presentation/pages/login_page.dart';
import 'package:quiz_academy/features/auth/presentation/pages/register_page.dart';
import 'package:quiz_academy/features/bottom_nav/presentation/bottom_nav_page.dart';
import 'package:quiz_academy/features/exam/presentation/pages/exam_page.dart';
import 'package:quiz_academy/features/exam/presentation/pages/result_page.dart';
import 'package:quiz_academy/features/exam/presentation/pages/show_answers_page.dart';
import 'package:quiz_academy/features/home/domain/entities/subject_model.dart';
import 'package:quiz_academy/features/profile/presentation/pages/edit_profile_page.dart';
import 'package:quiz_academy/features/welcome_page/presentation/welcome_page.dart';


class AppRoutes {
  static String _getInitialLocation() {
    // Check if user is logged in
    final userId = CacheHelper.getData(key: 'uId');
    if (userId != null) {
      return RoutesName.bottomNavigationBar;
    }
    return RoutesName.welcomePage;
  }

  static GoRouter get router => GoRouter(
    initialLocation: _getInitialLocation(),
    routes: [
      GoRoute(
        path: RoutesName.welcomePage,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const WelcomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
      GoRoute(
        path: RoutesName.loginPage,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const LoginPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
      GoRoute(
        path: RoutesName.authPage,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const AuthPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
      GoRoute(
        path: RoutesName.registerPage,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const RegisterPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
      GoRoute(
        path: RoutesName.bottomNavigationBar,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const BottomNavPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
      GoRoute(
        path: RoutesName.editProfilePage,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const EditProfilePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
      GoRoute(
        path: RoutesName.resultPage,
        pageBuilder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return CustomTransitionPage(
            key: state.pageKey,
            child: ResultPage(resultData: data),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          );
        },
      ),
      GoRoute(
  path: RoutesName.showAnswersPage,
  builder: (context, state) {
    final data = state.extra as Map<String, dynamic>;
    return ShowAnswersPage(
      subject: data['subject'],
      userAnswers: data['userAnswers'],
    );
  },
),
      GoRoute(
        path: RoutesName.examPage,
        pageBuilder: (context, state) {
          final subject = state.extra as SubjectModel;

          return CustomTransitionPage(
            key: state.pageKey,
            child: ExamPage(subject: subject),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          );
        },
      ),
    ],
  );
}
