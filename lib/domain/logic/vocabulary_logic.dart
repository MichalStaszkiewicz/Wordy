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
import '../models/word.dart';
import '../repositiories/repository.dart';

class VocabularyLogic {
  final Repository _repository;
  VocabularyLogic(this._repository);
  Future<List<FlashCardData>> getVocabularyByTopic(String topic) async {
    return [];
  }
}
