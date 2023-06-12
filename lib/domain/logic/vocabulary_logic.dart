import 'package:wordy/domain/models/flash_card_data.dart';
import '../../utility/either.dart';
import '../repositiories/vocabulary_repository.dart';

class VocabularyService {
  final VocabularyRepository _repository;

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
