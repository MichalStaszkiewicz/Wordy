part of 'quiz_bloc.dart';

abstract class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object> get props => [];
}

class QuizInitial extends QuizState {
  QuizInitial();
}

class LearningQuizLoaded extends QuizState {
  LearningQuizLoaded(
      {required this.questions,
      required this.index,
      required this.selected,
      required this.question_answer_state,
      required this.correct,required this.topic});
  final List<QuizQuestion> questions;
  bool selected;
  int index;
  List<CourseEntry> correct;
  List<int> question_answer_state;
  final String topic;
  @override
  List<Object> get props =>
      [questions, index, selected, question_answer_state, correct,topic];
}

class QuizCompleted extends QuizState {
  QuizCompleted({required this.image});
  String image;
}

class ReviewQuizLoaded extends QuizState {
  ReviewQuizLoaded(
      {required this.questions,
      required this.index,
      required this.selected,
      required this.question_answer_state,
      required this.correct,required this.topic});
  final List<QuizQuestion> questions;
  bool selected;
  int index;
  List<CourseEntry> correct;
  List<int> question_answer_state;
  final String topic;
  @override
  List<Object> get props =>
      [questions, index, selected, question_answer_state, correct,topic];
}
