import 'package:equatable/equatable.dart';

import '../../data/dto/learned_word_dto.dart';

class LearnedWord extends Equatable {
  LearnedWord(
      {required this.question, required this.answer, required this.wordId});
  String question;
  String answer;
  int wordId;

  LearnedWordDto toDto() {
    return LearnedWordDto(question: question, answer: answer, wordId: wordId);
  }

  @override
  List<Object?> get props => [question, answer];
}
