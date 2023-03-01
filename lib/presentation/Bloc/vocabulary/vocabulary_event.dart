part of 'vocabulary_bloc.dart';

abstract class VocabularyEvent extends Equatable {
  const VocabularyEvent();

  @override
  List<Object> get props => [];
}

class LoadVocabulary extends VocabularyEvent {
  LoadVocabulary({required this.language});
  String language;
}



class ListVocabularyWordsByTopic extends VocabularyEvent{
ListVocabularyWordsByTopic({required this.topic});
String topic;

}
class SearchForSpecificVocabulary extends VocabularyEvent {
  SearchForSpecificVocabulary({required this.text});
  String text;
  @override
  List<Object> get props => [text];
}
