import 'dart:math';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:wordy/Utility/utility.dart';
import 'package:wordy/data/local/local_database.dart';
import 'package:wordy/data/local/local_repository_implementation.dart';
import 'package:wordy/data/network/remote_source.dart';
import 'package:wordy/domain/models/course_entry.dart';
import 'package:wordy/domain/models/flash_card_data.dart';
import 'package:wordy/domain/models/quiz_question.dart';
import 'package:wordy/localizator.dart';

import '../../data/network/network_repository_implementation.dart';
import '../../data/network/request/models/flash_card_list_request_model.dart';
import '../../data/network/request/models/words_by_topic_request_model.dart';
import '../models/user.dart';
import '../models/word.dart';
import '../repositiories/repository.dart';

class VocabularyLogic {
  Repository _repository = Repository();
  final user = locator.get<User>();
  Future<List<FlashCardData>> getVocabularyByTopic(String topic) async {
    try {
      return await _repository
          .createFlashCardList(FlashCardListModel(
              course: user.currentCourse,
              interfaceLanguage: user.interfaceLanguage,
              topic: topic))
          .then((value) => value.flashcards.map((e) => e.toDomain()).toList());
    } on Exception catch (e) {
      rethrow;
    }
  }
}
