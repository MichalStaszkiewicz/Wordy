import 'package:wordy/domain/models/question.dart';

class BeginnerQuestion extends Question {
  int correctAnswerIndex;
  int wordId;

  BeginnerQuestion(String question, List<String> answers,
      this.correctAnswerIndex, this.wordId)
      : super(question, answers);
}
