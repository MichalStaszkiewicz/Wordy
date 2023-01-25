import 'package:wordy/domain/models/quiz_question.dart';

import '../../data/dto/word_dto.dart';

abstract class LocalInterface{
Future<List<WordDto>> getUserLearnedWordies();


}