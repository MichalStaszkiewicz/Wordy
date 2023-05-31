import 'package:wordy/domain/models/topic.dart';

class Word {
  Word({
    required this.polish,
    required this.english,
    required this.french,
    required this.spanish,
  });
  final String polish;
  final String english;
  final String french;
  final String spanish;
}
