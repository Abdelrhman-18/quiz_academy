abstract class AuthRepository {
  Future<int?> register(String username, String email, String password);
  Future<Map<String, dynamic>?> signIn(String email, String password);
}
