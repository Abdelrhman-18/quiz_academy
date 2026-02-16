import 'package:injectable/injectable.dart';
import 'package:quiz_academy/core/database/data_base_helper.dart';

abstract class AuthDataSource {
  Future<int?> register(String username, String email, String password);
  Future<Map<String, dynamic>?> signIn(String email, String password);
}
@LazySingleton(as: AuthDataSource)
class AuthDatasourceImpl implements AuthDataSource {
  final DatabaseHelper databaseHelper;
  AuthDatasourceImpl(this.databaseHelper);
  @override
  Future<int?> register(String username, String email, String password) async {
    final result = await databaseHelper.register(username, password, email);
    if (result == -1) {
      throw Exception("Failed to register user");
    }
    return result;
  }

  @override
  Future<Map<String, dynamic>?> signIn(String email, String password) async {
    final result = await databaseHelper.login(email, password);
    if (result == null) {
      throw Exception("Failed to sign in user");
    }
    return result; // Return full user data
  }

}