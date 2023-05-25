part of 'quiz_bloc.dart';

abstract class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object?> get props => [];
}

class QuizInitial extends QuizState {
  QuizInitial();
}

class InProgress extends QuizState {
  InProgress();
}

class BeginnerQuizLoaded extends QuizState {
  BeginnerQuizLoaded(
      {required this.questions,
      required this.currentQuestionIndex,
      required this.selectedIndex});
  List<BeginnerQuestion> questions;
  int currentQuestionIndex;
  int? selectedIndex;
  @override
  List<Object?> get props => [questions, currentQuestionIndex, selectedIndex];
}

class QuizCompleted extends QuizState {
  QuizCompleted();
}
