import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quiz_academy/core/database/cache_helper.dart';
import 'package:quiz_academy/features/results_history/domain/usecases/get_result_history_usecase.dart';
import 'package:quiz_academy/features/results_history/presentation/cubit/results_history_state.dart';

@injectable
class ResultsHistoryCubit extends Cubit<ResultsHistoryState> {
  final GetResultHistoryUsecase getExamResultsUseCase;

  ResultsHistoryCubit(this.getExamResultsUseCase) : super(const ResultsHistoryState.initial());

  Future<void> getResults() async {
    emit(const ResultsHistoryState.loading());
    try {
      final userId = CacheHelper.getData(key: "uId");
      if (userId == null) {
        emit(const ResultsHistoryState.error("User ID not found"));
        return;
      }
      final results = await getExamResultsUseCase(userId);
      print('📊 Fetched ${results.length} results for user $userId');
      emit(ResultsHistoryState.success(results));
    } catch (e) {
      emit(ResultsHistoryState.error(e.toString()));
    }
  }
}
