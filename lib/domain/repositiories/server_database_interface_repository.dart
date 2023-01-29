import '../../data/dto/word_dto.dart';

abstract class ServerInterface {
  Future<List<WordDto>> getAllWordies();
  Future<List<WordDto>> getWordiesByTopic(String topic);
  Future<int> getWordiesCountByTopic(String topic);
  
}
