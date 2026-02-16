import 'package:injectable/injectable.dart';
import 'package:quiz_academy/core/database/data_base_helper.dart';

abstract class SaveExamResultDataSource {
  Future<void> saveExamResult(int userId, int score,int total ,String subject);
}
@LazySingleton(as: SaveExamResultDataSource)
class SaveExamResultDataSourceImpl implements SaveExamResultDataSource {
  final DatabaseHelper databaseHelper;
  SaveExamResultDataSourceImpl(this.databaseHelper);
  @override
  Future<void> saveExamResult(int userId, int score,int total ,String subject) async {
    await databaseHelper.saveResult(userId, score,total,subject);
  }


}