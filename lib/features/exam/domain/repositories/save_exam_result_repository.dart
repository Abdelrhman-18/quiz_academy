
abstract class SaveExamResultRepository {
  Future<void> saveExamResult(int userId, int score,int total,String subject);
}