import 'package:wordy/domain/models/flash_card_data.dart';
import 'package:wordy/domain/repositiories/repository.dart';
import '../../utility/either.dart';

class VocabularyService {
  final Repository _repository;

  VocabularyService(this._repository);
  Future<Either<Exception, List<FlashCardData>>> getVocabularyByTopic(
      String topic, String token) async {
    var flashCards = await _repository.createFlashCardList(topic, token);
    if (flashCards.isData) {
      return Either.data(flashCards.data);
    } else {
      return Either.error(flashCards.error);
    }
  }
}
