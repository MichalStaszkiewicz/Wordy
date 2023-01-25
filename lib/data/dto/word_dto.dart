
import 'package:wordy/domain/models/word.dart';

class WordDto {
  WordDto(
      {required this.polish,
      required this.english,
      required this.french,
      required this.spanish});
  final String polish;
  final String english;
  final String french;
  final String spanish;

  Word toDomain() {
    return Word(
        polish: polish, english: english, french: french, spanish: spanish);
  }
}
