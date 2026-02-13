import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_academy/core/routes/routes_name.dart';
import 'package:quiz_academy/features/welcome_page/presentation/welcome_page.dart';
class AppRoutes {
 static GoRouter get router => GoRouter(
    initialLocation: RoutesName.welcomePage,
        routes: [
          GoRoute(
            path: RoutesName.welcomePage,
            pageBuilder: (context, state) => const MaterialPage(child: WelcomePage()),
          )
        ],
      );
}