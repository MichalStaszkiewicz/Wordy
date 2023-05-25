import 'package:wordy/domain/models/question.dart';

class BeginnerQuestion extends Question {
  int correctAnswerIndex;

  BeginnerQuestion(
      String question, List<String> answers, this.correctAnswerIndex)
      : super(question, answers);
}
