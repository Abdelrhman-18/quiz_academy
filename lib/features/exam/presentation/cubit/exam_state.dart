import 'package:freezed_annotation/freezed_annotation.dart';

part 'exam_state.freezed.dart';
@freezed
class ExamState with _$ExamState {
  const factory ExamState.initial() = _Initial;
  const factory ExamState.loading() = _Loading;
  const factory ExamState.timerRunInProgress(int remainingTime) = _TimerRunInProgress;
  const factory ExamState.saveExamResult(String subject) = _SaveExamResult;
  const factory ExamState.error(String message) = _Error;
}