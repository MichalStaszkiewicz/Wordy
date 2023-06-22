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

class BeginnerQuizLoaded extends QuizState {
  BeginnerQuizLoaded(
      {required this.questions,
      required this.currentQuestionIndex,
      required this.selectedIndex,
      required this.correctAnswersWordIndexes,
      required this.courseName,
      required this.answerChecked});
  List<BeginnerQuestion> questions;
  int currentQuestionIndex;
  int? selectedIndex;
  List<int> correctAnswersWordIndexes;
  String courseName;
  bool answerChecked;

  @override
  List<Object?> get props => [
        questions,
        answerChecked,
        currentQuestionIndex,
        selectedIndex,
        correctAnswersWordIndexes,
        courseName,
      ];
}

class QuizCompleted extends QuizState {
  QuizCompleted({required this.topicCompleted});
  bool topicCompleted = false;

  @override
  List<Object> get props => [
        topicCompleted,
      ];
}
