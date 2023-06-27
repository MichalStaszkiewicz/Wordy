part of 'quiz_bloc.dart';

abstract class QuizEvent extends Equatable {
  const QuizEvent();

  @override
  List<Object> get props => [];
}

class LoadBeginnerQuiz extends QuizEvent {
  LoadBeginnerQuiz({
    required this.topic,
  });
  String topic;
}

class LoadNextQuestion extends QuizEvent {
  const LoadNextQuestion();
}

class AchievementNotificationEvent extends QuizEvent {
  AchievementNotificationEvent({required this.achievements});
  List<Achievement> achievements;
  @override
  List<Object> get props => [];
}

class SelectAnswer extends QuizEvent {
  SelectAnswer({required this.selectedIndex});
  int selectedIndex;
}

class CheckAnswer extends QuizEvent {
  CheckAnswer({required this.questionIndex, required this.selectedIndex});
  int questionIndex;
  int selectedIndex;
}

class FinishQuiz extends QuizEvent {
  FinishQuiz({
    required this.wordIds,
    required this.topic,
  });
  List<int> wordIds;
  String topic;
}
