import 'package:injectable/injectable.dart';
import 'package:quiz_academy/features/exam/domain/repositories/save_exam_result_repository.dart';

@injectable
class SaveExamResultUseCase {
  final SaveExamResultRepository repository;

  SaveExamResultUseCase(this.repository);

  Future<void> call(int userId, int score, int total, String subject) async {
    await repository.saveExamResult(userId, score, total, subject);
  }
}
