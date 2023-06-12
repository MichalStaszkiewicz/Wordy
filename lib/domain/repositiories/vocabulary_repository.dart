import 'package:dio/dio.dart';
import 'package:wordy/domain/repositiories/repository.dart';

import '../../utility/either.dart';
import '../models/flash_card_data.dart';

class VocabularyRepository {
  final Repository _repository;
  VocabularyRepository(this._repository);

  Future<Either<DioError, List<FlashCardData>>> createFlashCardList(
      String topic, String token) async {
    var response = await _repository.createFlashCardList(topic, token);
    if (response.isData) {
      return Either.data(response.data!);
    } else {
      return Either.error(response.error);
    }
  }
}
