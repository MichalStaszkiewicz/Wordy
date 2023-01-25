import '../../data/dto/word_dto.dart';

abstract class ServerInterface {
  Future<List<WordDto>> getWordies(String topic);
}
