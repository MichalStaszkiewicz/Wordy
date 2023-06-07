import 'package:dio/dio.dart';
import 'package:wordy/domain/repositiories/repository.dart';

import '../../data/network/request/models/flash_card_list_request_model.dart';
import '../../utility/either.dart';
import '../models/flash_card_data.dart';

class VocabularyRepository {
  final Repository _repository;
  VocabularyRepository(this._repository);

  Future<Either<DioError, List<FlashCardData>>> createFlashCardList(
      FlashCardListModel request) async {
    var response = await _repository.createFlashCardList(request);
    if (response.isRight) {
      return Either.right(response.right!);
    } else {
      return Either.left(response.left);
    }
  }
}
