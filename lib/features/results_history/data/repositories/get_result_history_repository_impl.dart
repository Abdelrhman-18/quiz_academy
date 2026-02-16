import 'package:injectable/injectable.dart';
import 'package:quiz_academy/features/results_history/data/datasources/get_result_history_datasource.dart';
import 'package:quiz_academy/features/results_history/data/models/result_model.dart';
import 'package:quiz_academy/features/results_history/domain/repositories/get_result_history_repository.dart';
@Injectable(as: GetResultHistoryRepository)
class GetResultHistoryRepositoryImpl implements GetResultHistoryRepository {
  final GetResultHistoryDatasource datasource;

  GetResultHistoryRepositoryImpl(this.datasource);

  @override
  Future<List<ResultHistoryModel>> getResultHistory(int userId) async {
    return await datasource.getResultHistory(userId);
  }
}