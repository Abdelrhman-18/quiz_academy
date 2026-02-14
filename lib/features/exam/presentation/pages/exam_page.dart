import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExamPage extends StatefulWidget {
  const ExamPage({super.key});

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  int currentIndex = 0;
  
  // مثال للبيانات (هتكون جاية من ملف الأسئلة بتاعك)
  final List<Map<String, dynamic>> quizData = [
    {
      "question": "What is the name of the toy cowboy in Toy Story?",
      "options": ["SMITH", "WOODY", "JACK"],
      "correctAnswer": "WOODY"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4B3587), 
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent, width: 2),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Text(
            "05", 
            style: TextStyle(color: Colors.white, fontSize: 16.sp),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Row(
                  children: [
                    Text("602", style: TextStyle(color: Colors.white, fontSize: 14.sp)),
                    SizedBox(width: 5.w),
                    const Icon(Icons.monetization_on, color: Colors.orange, size: 18),
                  ],
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
              "Question ${currentIndex + 1} of ${quizData.length * 20}", 
              style: TextStyle(color: Colors.white70, fontSize: 16.sp),
            ),
            SizedBox(height: 20.h),
            Text(
              quizData[currentIndex]["question"],
              style: TextStyle(
                color: Colors.white,
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40.h),
            Expanded(
              child: ListView.builder(
                itemCount: quizData[currentIndex]["options"].length,
                itemBuilder: (context, index) {
                  String option = quizData[currentIndex]["options"][index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 15.h),
                    child: InkWell(
                      onTap: () {
                      },
                      borderRadius: BorderRadius.circular(25.r),
                      child: Container(
                        width: double.infinity,
                        height: 65.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            )
                          ],
                        ),
                        child: Text(
                          option,
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}