import 'package:quiz_academy/features/results_history/data/models/result_model.dart';

abstract class GetResultHistoryRepository {
  Future<List<ResultHistoryModel>> getResultHistory(int userId);
}