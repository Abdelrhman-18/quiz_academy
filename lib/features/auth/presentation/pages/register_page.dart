import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_academy/core/di/di.dart';
import 'package:quiz_academy/core/routes/routes_name.dart';
import 'package:quiz_academy/core/shared_widgets/custm_buttom.dart';
import 'package:quiz_academy/core/theme/app_colors.dart';
import 'package:quiz_academy/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:quiz_academy/features/auth/presentation/cubit/auth_state.dart';
import 'package:quiz_academy/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:quiz_academy/features/auth/presentation/widgets/or_divider.dart';
import 'package:quiz_academy/features/auth/presentation/widgets/password_text_field.dart';

import 'package:quiz_academy/core/utils/snackbar_helper.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/auth_background.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      state.whenOrNull(
                        authenticated: (message) {
                          SnackBarHelper.showSuccess(context, message);
                          context.go(RoutesName.bottomNavigationBar);
                        },
                        error: (message) {
                          SnackBarHelper.showError(context, message);
                        },
                      );
                    },
                    builder: (context, state) {
                      return Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            SizedBox(height: 200.h),
                            Text(
                              'Create New Account',
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 32.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              "Please register to create your account",
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 16.sp,
                              ),
                            ),
                            SizedBox(height: 40.h),

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
                            CustomTextFormField(
                              controller: _emailController,
                              hintText: 'Email',
                              prefixIcon: Icons.email_outlined,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty)
                                  return 'Please enter your Email';
                                if (!RegExp(
                                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                                ).hasMatch(value)) {
                                  return 'Please enter a valid email address';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20.h),
                            CustomPasswordField(
                              controller: _passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your Password';
                                }
                                if (value.length < 6) {
                                  return 'Password must be at least 6 characters';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 30.h),
                            state.maybeWhen(
                              loading: () => Center(
                                child: const CircularProgressIndicator(),
                              ),
                              orElse: () => CustmButtom(
                                title: 'REGISTER',
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<AuthCubit>().register(
                                      username: _usernameController.text,

                                      email: _emailController.text,
                                      password: _passwordController.text,
                                    );
                                  } else {
                                    log("Form is not valid");
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: 25.h),
                            OrDivider(),
                            SizedBox(height: 20.h),
                            TextButton(
                              onPressed: () {
                                context.push(RoutesName.loginPage);
                              },
                              child: Text(
                                "Login to your account",
                                style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
