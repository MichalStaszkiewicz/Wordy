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
  QuizLoaded({required this.questions, required this.index});
  final List<QuizQuestion> questions;
  int index;


  @override
  List<Object> get props => [questions, index];
}

class QuizCompleted extends QuizState {
  QuizCompleted();
}
