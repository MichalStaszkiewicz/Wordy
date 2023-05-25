part of 'quiz_bloc.dart';

abstract class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object> get props => [];
}

class QuizInitial extends QuizState {
  QuizInitial();
}

class BegginerQuizLoaded extends QuizState {
  BegginerQuizLoaded();

  @override
  List<Object> get props => [];
}

class QuizCompleted extends QuizState {
  QuizCompleted();
}
