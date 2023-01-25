part of 'quiz_bloc.dart';

abstract class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object> get props => [];
}

class QuizInitial extends QuizState {
  QuizInitial();
}

class QuizLoaded extends QuizState {
  QuizLoaded(
      {required this.questions,
      required this.index,
      required this.selected,
      required this.question_answer_state,
      required this.correct});
  final List<QuizQuestion> questions;
  bool selected;
  int index;
  List<String> correct;
  List<int> question_answer_state;

  @override
  List<Object> get props =>
      [questions, index, selected, question_answer_state, correct];
}

class QuizCompleted extends QuizState {
  QuizCompleted();
}
