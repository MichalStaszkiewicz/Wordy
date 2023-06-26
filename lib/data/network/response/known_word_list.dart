import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/models/word.dart';

part 'known_word_list.freezed.dart';
part 'known_word_list.g.dart';

@freezed
class KnownWordList with _$KnownWordList {
  const factory KnownWordList({
    required List<Word> knownWords,
  }) = _KnownWordList;

  factory KnownWordList.fromJson(Map<String, dynamic> json) =>
      _$KnownWordListFromJson(json);
}
