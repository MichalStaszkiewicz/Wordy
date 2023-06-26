import 'package:wordy/domain/models/question.dart';

class VocabularyQuestion extends Question {
  VocabularyQuestion({
    required String question,
    required List<String> answers,
    required this.correctAnswerIndex,
    required this.wordId,
  }) : super(question: question, answers: answers);

  int correctAnswerIndex;
  int wordId;
}
