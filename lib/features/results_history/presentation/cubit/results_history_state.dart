import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_academy/features/results_history/data/models/result_model.dart';

part 'results_history_state.freezed.dart';

@freezed
class ResultsHistoryState with _$ResultsHistoryState {
  const factory ResultsHistoryState.initial() = _Initial;
  const factory ResultsHistoryState.loading() = _Loading;
  const factory ResultsHistoryState.success(List<ResultHistoryModel> results) = _Success;
  const factory ResultsHistoryState.error(String message) = _Error;
}
