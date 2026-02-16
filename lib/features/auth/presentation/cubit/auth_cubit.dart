import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quiz_academy/core/database/cache_helper.dart';
import 'package:quiz_academy/features/auth/domain/usecases/login_usecase.dart';
import 'package:quiz_academy/features/auth/domain/usecases/register_usecase.dart';
import 'package:quiz_academy/features/auth/presentation/cubit/auth_state.dart';
@injectable
class AuthCubit extends Cubit<AuthState> {
  final LoginUsecase loginUseCase;
  final RegisterUsecase registerUseCase;

  AuthCubit(this.loginUseCase, this.registerUseCase)
      : super(const AuthState.initial());

  Future<void> login({required String email, required String password}) async {
    emit(const AuthState.loading());
    
    await Future.delayed(const Duration(seconds: 3));

    try {
      final userData = await loginUseCase(email, password);

      if (userData != null) {
        // Save all user data to SharedPreferences
        await CacheHelper.saveData(key: 'uId', value: userData['id']);
        await CacheHelper.saveData(key: 'username', value: userData['username']);
        await CacheHelper.saveData(key: 'email', value: userData['email']);
        
        emit(const AuthState.authenticated("Welcome back!"));
      } else {
        emit(const AuthState.error("Invalid email or password"));
      }
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> register({
    required String email,
    required String password,
    required String username,
  }) async {
    emit(const AuthState.loading());
    try {
      final int? userId = await registerUseCase(username, email, password);
      
      if (userId != null) {
        // Save user data to SharedPreferences
        await CacheHelper.saveData(key: 'uId', value: userId);
        await CacheHelper.saveData(key: 'username', value: username);
        await CacheHelper.saveData(key: 'email', value: email);
        
        emit(const AuthState.authenticated("Registration successful!"));
      } else {
        emit(const AuthState.error("Registration failed"));
      }
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }
}