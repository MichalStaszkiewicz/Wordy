import 'package:wordy/domain/models/question.dart';

class BeginnerQuestion extends Question {
  BeginnerQuestion({
    required String question,
    required List<String> answers,
    required this.correctAnswerIndex,
    required this.wordId,
  }) : super(question: question, answers: answers);

  int correctAnswerIndex;
  int wordId;
}
