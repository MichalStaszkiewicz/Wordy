part of 'quiz_bloc.dart';

abstract class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object?> get props => [];
}

class QuizInitial extends QuizState {
  const QuizInitial();
}

class AchievementInformation extends QuizState {
  AchievementInformation({required this.achievements});
  List<Achievement> achievements;
}

class InProgress extends QuizState {
  const InProgress();
}

class QuizError extends QuizState {
  QuizError({required this.error});
  CustomError error;
}

class QuizQuestionState extends QuizState {
  QuizQuestionState(
      {required this.question,
      required this.selectedIndex,
      required this.answerChecked});
  BeginnerQuestion question;
  int? selectedIndex;
  bool answerChecked;

  @override
  List<Object?> get props => [question, selectedIndex, answerChecked];
}

class AnswerChecked extends QuizState {
  AnswerChecked({required this.selectedAnswer, required this.correctAnswer});

  String selectedAnswer;
  String correctAnswer;
}

class QuizCompleted extends QuizState {
  QuizCompleted({required this.topicCompleted, });
  bool topicCompleted = false;

  @override
  List<Object> get props => [
        topicCompleted,
      ];
}
