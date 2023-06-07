import 'dart:math';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:wordy/Utility/utility.dart';
import 'package:wordy/data/network/remote_source.dart';
import 'package:wordy/domain/models/course_entry.dart';
import 'package:wordy/domain/models/flash_card_data.dart';
import 'package:wordy/domain/models/quiz_question.dart';
import 'package:wordy/utility/locator/storage_locator.dart';
import '../../data/network/request/models/flash_card_list_request_model.dart';
import '../../data/network/request/models/words_by_topic_request_model.dart';
import '../../utility/either.dart';
import '../models/word.dart';
import '../repositiories/repository.dart';
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
