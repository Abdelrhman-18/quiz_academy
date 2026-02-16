import 'package:injectable/injectable.dart';
import 'package:quiz_academy/features/auth/domain/repositories/auth_repository.dart';
@injectable
class LoginUsecase {
  final AuthRepository repository;
  LoginUsecase(this.repository);
  Future<Map<String, dynamic>?> call(String email, String password) async {
    return await repository.signIn(email, password);
  }
}
