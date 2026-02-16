import 'package:injectable/injectable.dart';
import 'package:quiz_academy/core/database/data_base_helper.dart';
import 'package:quiz_academy/features/results_history/data/models/result_model.dart';

abstract class GetResultHistoryDatasource {
  Future<List<ResultHistoryModel>> getResultHistory(int userId);
}
@LazySingleton(as: GetResultHistoryDatasource)
class GetResultHistoryDatasourceImpl implements GetResultHistoryDatasource {
  final DatabaseHelper databaseHelper;
  GetResultHistoryDatasourceImpl(this.databaseHelper);
  @override
  Future<List<ResultHistoryModel>> getResultHistory(int userId) async {
   return databaseHelper.getUserHistory(userId);
  }
}