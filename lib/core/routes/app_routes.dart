import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_academy/core/routes/routes_name.dart';
import 'package:quiz_academy/features/auth/presentation/pages/auth_page.dart';
import 'package:quiz_academy/features/auth/presentation/pages/login_page.dart';
import 'package:quiz_academy/features/auth/presentation/pages/register_page.dart';
import 'package:quiz_academy/features/bottom_nav/presentation/bottom_nav_page.dart';
import 'package:quiz_academy/features/exam/presentation/pages/exam_page.dart';
import 'package:quiz_academy/features/welcome_page/presentation/welcome_page.dart';

class AppRoutes {
  static GoRouter get router => GoRouter(
        initialLocation: RoutesName.bottomNavigationBar,
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
            path: RoutesName.examPage,
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const ExamPage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation, child: child);
              },
            ),
          ),
         
        ],
      );
}