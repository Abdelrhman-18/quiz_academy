import 'package:injectable/injectable.dart';
import 'package:quiz_academy/features/exam/data/datasources/save_exam_result_datasource.dart';
import 'package:quiz_academy/features/exam/domain/repositories/save_exam_result_repository.dart';

@Injectable(as: SaveExamResultRepository)
class SaveExamResultRepositoryImpl implements SaveExamResultRepository {
  final SaveExamResultDataSource dataSource;

  SaveExamResultRepositoryImpl(this.dataSource);

  @override
  Future<void> saveExamResult(
    int userId,
    int score,
    int total,
    String subject,
  ) async {
    await dataSource.saveExamResult(userId, score, total, subject);
  }


}
