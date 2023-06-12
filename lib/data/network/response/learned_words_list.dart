import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/models/word.dart';

part 'learned_words_list.freezed.dart';
part 'learned_words_list.g.dart';

@freezed
class LearnedWordsList with _$LearnedWordsList {
  const factory LearnedWordsList({
    required List<Word> learnedWords,
  }) = _LearnedWordsList;

  factory LearnedWordsList.fromJson(Map<String, dynamic> json) =>
      _$LearnedWordsListFromJson(json);
}
