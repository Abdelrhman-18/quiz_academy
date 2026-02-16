import 'package:injectable/injectable.dart';
import 'package:quiz_academy/features/auth/domain/repositories/auth_repository.dart';


@injectable
class RegisterUsecase {
  final AuthRepository repository;
  RegisterUsecase(this.repository);
  Future<int?> call(String username, String email, String password) async {
    return await repository.register(username, email, password);
  }
}
