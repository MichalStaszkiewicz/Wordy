part of 'vocabulary_bloc.dart';

abstract class VocabularyEvent extends Equatable {
  const VocabularyEvent();

  @override
  List<Object> get props => [];
}

class LoadVocabulary extends VocabularyEvent {
  const LoadVocabulary();
}

class ListVocabularyWordsByTopic extends VocabularyEvent {
  ListVocabularyWordsByTopic({required this.topic});
  String topic;
}

class SearchForSpecificVocabulary extends VocabularyEvent {
  SearchForSpecificVocabulary({required this.text});
  String text;
  @override
  List<Object> get props => [text];
}
