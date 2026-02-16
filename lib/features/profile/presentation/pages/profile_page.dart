import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_academy/core/database/cache_helper.dart';
import 'package:quiz_academy/core/routes/routes_name.dart';
import 'package:quiz_academy/core/shared_widgets/profile_option_item.dart';
import 'package:quiz_academy/core/shared_widgets/stat_card.dart';
import 'package:quiz_academy/core/theme/app_colors.dart';
import 'package:quiz_academy/core/di/di.dart';
import 'package:quiz_academy/features/results_history/data/models/result_model.dart';
import 'package:quiz_academy/features/results_history/presentation/cubit/results_history_cubit.dart';
import 'package:quiz_academy/features/results_history/presentation/cubit/results_history_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username = 'User';
  String email = 'user@email.com';
  int? currentUserId;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  void didUpdateWidget(ProfilePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Reload data to ensure fresh user info
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final loadedUserId = CacheHelper.getData(key: 'uId');
    final loadedUsername = CacheHelper.getData(key: 'username');
    final loadedEmail = CacheHelper.getData(key: 'email');
    
    // Update if any data has changed
    if (loadedUserId != currentUserId || 
        loadedUsername != username || 
        loadedEmail != email) {
      setState(() {
        currentUserId = loadedUserId;
        username = loadedUsername ?? 'User';
        email = loadedEmail ?? 'user@email.com';
      });
    }
  }

  Future<void> _logout() async {
    // Show confirmation dialog
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Logout', style: TextStyle(color: AppColors.darkBlueColor)),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => context.pop(false),
            child: Text('Cancel', style: TextStyle(color: AppColors.greyColor)),
          ),
          TextButton(
            onPressed: () => context.pop(true),
            child: Text('Logout', style: TextStyle(color: AppColors.redColor)),
          ),
        ],
      ),
    );

    if (shouldLogout == true && mounted) {
      // Clear user data
      await CacheHelper.removeData(key: 'uId');
      await CacheHelper.removeData(key: 'username');
      await CacheHelper.removeData(key: 'email');
      
      // Navigate to login page
      if (mounted) {
        context.go(RoutesName.loginPage);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        title: Text(
          "Profile",
          style: TextStyle(
            color: AppColors.darkBlueColor,
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              // Profile picture and name section
              Center(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 60.r,
                          backgroundColor: AppColors.primaryColor.withOpacity(0.1),
                          child: Icon(Icons.person, size: 70.sp, color: AppColors.primaryColor),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 18.r,
                            backgroundColor: AppColors.primaryColor,
                            child: Icon(Icons.edit, color: AppColors.whiteColor, size: 18.sp),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      username,
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkBlueColor,
                      ),
                    ),
                    Text(
                      email,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.greyColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              
              BlocProvider(
                create: (context) => getIt<ResultsHistoryCubit>()..getResults(),
                child: BlocBuilder<ResultsHistoryCubit, ResultsHistoryState>(
                  builder: (context, state) {
                    final results = state.maybeWhen(
                      success: (data) => data,
                      orElse: () => <ResultHistoryModel>[],
                    );
                    
                    final totalQuiz = results.length;
                    final avgScore = totalQuiz > 0
                        ? (results.fold<int>(0, (sum, item) => sum + (item.total > 0 ? (item.score / item.total * 100).toInt() : 0)) / totalQuiz).toInt()
                        : 0;

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        StatCard(title: "Total Quiz", value: "$totalQuiz"),
                        StatCard(title: "Avg Score", value: "$avgScore%"),
                      ],
                    );
                  },
                ),
              ),
              
              SizedBox(height: 30.h),
              
              ProfileOptionItem(
                icon: Icons.person_outline,
                title: "Edit Profile",
                onTap: () {
                  context.push(RoutesName.editProfilePage).then((_) {
                    // Reload user data when returning from edit profile
                    _loadUserData();
                  });
                },
              ),
              ProfileOptionItem(
                icon: Icons.security,
                title: "Security",
                onTap: () {},
              ),
              ProfileOptionItem(
                icon: Icons.help_outline,
                title: "Help Center",
                onTap: () {},
              ),
              
              SizedBox(height: 20.h),
              
              ProfileOptionItem(
                icon: Icons.logout,
                title: "Logout",
                textColor: AppColors.redColor,
                iconColor: AppColors.redColor,
                showArrow: false,
                onTap: _logout,
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}