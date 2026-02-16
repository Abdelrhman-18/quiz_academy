import 'package:injectable/injectable.dart';
import 'package:quiz_academy/features/results_history/data/models/result_model.dart';
import 'package:quiz_academy/features/results_history/domain/repositories/get_result_history_repository.dart';
@injectable
class GetResultHistoryUsecase {
  final GetResultHistoryRepository repository;

  GetResultHistoryUsecase(this.repository);

  Future<List<ResultHistoryModel>> call(int userId) async {
    return await repository.getResultHistory(userId);

  }  
  }