import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quiz_academy/features/exam/domain/usecases/save_exam_result_usecase.dart';
import 'package:quiz_academy/features/exam/presentation/cubit/exam_state.dart';
import 'package:quiz_academy/features/home/domain/entities/subject_model.dart';

@injectable
class ExamCubit extends Cubit<ExamState> {
  final SaveExamResultUseCase saveExamResultUseCase;
  Timer? _timer;
  int _remainingTime = 600;

  ExamCubit(this.saveExamResultUseCase) : super(const ExamState.initial());

  void startTimer() {
    _timer?.cancel();
    _remainingTime = 600;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        _remainingTime--;
        emit(ExamState.timerRunInProgress(_remainingTime));
      } else {
        _timer?.cancel();
      }
    });
  }

  void submitExam({
    required int userId,
    required int score,
    required int total,
    required String subject,
  }) {
    _timer?.cancel();
    saveExamResultUseCase(userId, score, total, subject);
    emit(ExamState.saveExamResult(subject));
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return "${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}";
  }

  int calculateScore(SubjectModel subject, List<int?> userAnswers) {
    int score = 0;
    for (int i = 0; i < subject.questions.length; i++) {
      if (userAnswers[i] != null) {
        String selectedOption = subject.questions[i].options[userAnswers[i]!];
        if (selectedOption == subject.questions[i].answer) {
          score++;
        }
      }
    }
    return score;
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
