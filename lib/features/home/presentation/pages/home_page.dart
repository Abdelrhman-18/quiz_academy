import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_academy/core/database/cache_helper.dart';
import 'package:quiz_academy/core/routes/routes_name.dart';
import 'package:quiz_academy/core/shared_widgets/subject_card.dart';
import 'package:quiz_academy/core/theme/app_colors.dart';
import 'package:quiz_academy/features/home/domain/entities/subject_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = 'User';

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    final loadedUsername = CacheHelper.getData(key: 'username');
    setState(() {
      username = loadedUsername ?? 'User';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          "Hello, $username",
          style: TextStyle(
            color: AppColors.darkBlueColor,
            fontSize: 18.sp, 
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: CircleAvatar( 
              radius: 20.r,
              backgroundColor: AppColors.primaryColor,
              child: Icon(Icons.person, color: AppColors.whiteColor, size: 20.sp),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "What do you want to Quiz \ntoday?",
                  style: TextStyle(
                    color: AppColors.darkBlueColor,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20.h), 
                ListView.builder(
                  itemCount: subjects.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return SubjectCard(
                      name: subjects[index].name,
                      questionsCount: subjects[index].questionsCount,
                      icon: subjects[index].icon,
                      color: subjects[index].color,
                      onTap: () {
                        context.push(RoutesName.examPage, extra: subjects[index]);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
