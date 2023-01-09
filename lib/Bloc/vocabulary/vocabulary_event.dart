part of 'vocabulary_bloc.dart';

abstract class VocabularyEvent extends Equatable {
  const VocabularyEvent();

  @override
  List<Object> get props => [];
}

class LoadVocabulary extends VocabularyEvent {
  LoadVocabulary();
}

class SearchForSpecificVocabulary extends VocabularyEvent {
  SearchForSpecificVocabulary({required this.text});
  String text;
  @override
  List<Object> get props => [text];
}
