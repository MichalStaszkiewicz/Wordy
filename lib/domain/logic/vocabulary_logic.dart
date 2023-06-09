
import 'package:wordy/domain/models/flash_card_data.dart';
import '../../data/network/request/models/flash_card_list_request_model.dart';
import '../../utility/either.dart';
import '../repositiories/vocabulary_repository.dart';

class VocabularyService {
  final VocabularyRepository _repository;

  VocabularyService(this._repository);
  Future<Either<Exception, List<FlashCardData>>> getVocabularyByTopic(
      String topic, String userId) async {
    var flashCards = await _repository
        .createFlashCardList(FlashCardListModel(topic: topic, userId: userId));
    if (flashCards.isRight) {
      return Either.right(flashCards.right);
    } else {
      return Either.left(flashCards.left);
    }
  }
}
