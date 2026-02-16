import 'package:injectable/injectable.dart';
import 'package:quiz_academy/features/auth/data/datasources/auth_datasource.dart';
import 'package:quiz_academy/features/auth/domain/repositories/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthDataSource authDataSource;
  AuthRepositoryImpl(this.authDataSource);
  @override
  Future<int?> register(String username, String email, String password) async {
    return await authDataSource.register(username, email, password);
  }

  @override
  Future<Map<String, dynamic>?> signIn(String email, String password) async {
    return await authDataSource.signIn(email, password);
  }
}
