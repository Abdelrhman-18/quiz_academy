import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_academy/core/database/cache_helper.dart';
import 'package:quiz_academy/core/shared_widgets/custm_buttom.dart';
import 'package:quiz_academy/core/theme/app_colors.dart';
import 'package:quiz_academy/core/utils/snackbar_helper.dart';
import 'package:quiz_academy/features/auth/presentation/widgets/custom_text_field.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final username = CacheHelper.getData(key: 'username') ?? '';
    final email = CacheHelper.getData(key: 'email') ?? '';
    
    setState(() {
      _usernameController.text = username;
      _emailController.text = email;
    });
  }

  Future<void> _saveProfile() async {
    if (_formKey.currentState!.validate()) {
      await CacheHelper.saveData(key: 'username', value: _usernameController.text);
      await CacheHelper.saveData(key: 'email', value: _emailController.text);
      
      if (mounted) {
        SnackBarHelper.showSuccess(context, 'Profile updated successfully!');
        context.pop();
      }
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    super.dispose();
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
          "Edit Profile",
          style: TextStyle(
            color: AppColors.darkBlueColor,
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.darkBlueColor),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 40.h),
                
                // Profile Picture
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
                        child: Icon(Icons.camera_alt, color: AppColors.whiteColor, size: 18.sp),
                      ),
                    ),
                  ],
                ),
                
                SizedBox(height: 40.h),
                
                // Username Field
                CustomTextFormField(
                  controller: _usernameController,
                  hintText: 'Username',
                  prefixIcon: Icons.person_outline,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                
                SizedBox(height: 20.h),
                
                // Email Field
                CustomTextFormField(
                  controller: _emailController,
                  hintText: 'Email',
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                
                SizedBox(height: 40.h),
                
                // Save Button
                CustmButtom(
                  title: 'SAVE CHANGES',
                  onPressed: _saveProfile,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
