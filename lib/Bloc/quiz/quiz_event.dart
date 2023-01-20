part of 'quiz_bloc.dart';

abstract class QuizEvent extends Equatable {
  const QuizEvent();

  @override
  List<Object> get props => [];
}

class LoadQuestionsForLearning extends QuizEvent {
  LoadQuestionsForLearning({required this.topic});

  final String topic;
  @override
  List<Object> get props => [topic];
}

class LoadQuestionsForReview extends QuizEvent {
  LoadQuestionsForReview({required this.topic});

  final String topic;
  @override
  List<Object> get props => [topic];
}


class SelectAnswer extends QuizEvent{
SelectAnswer({required this.index});
int index;


}
class LoadNextQuestion extends QuizEvent {
  LoadNextQuestion();
}
