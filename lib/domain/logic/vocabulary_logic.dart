import 'package:wordy/domain/models/flash_card_data.dart';
import '../../utility/either.dart';
import '../repositiories/vocabulary_repository.dart';

class VocabularyService {
  final VocabularyRepository _repository;

  VocabularyService(this._repository);
  Future<Either<Exception, List<FlashCardData>>> getVocabularyByTopic(
      String topic, String userId) async {
    var flashCards = await _repository.createFlashCardList(topic);
    if (flashCards.isRight) {
      return Either.data(flashCards.right);
    } else {
      return Either.error(flashCards.left);
    }
  }
}
