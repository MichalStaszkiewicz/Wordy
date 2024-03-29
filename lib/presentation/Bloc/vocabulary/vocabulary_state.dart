part of 'vocabulary_bloc.dart';

abstract class VocabularyState extends Equatable {
  const VocabularyState();

  @override
  List<Object> get props => [];
}

class VocabularyInitial extends VocabularyState {}

class VocabularyLoaded extends VocabularyState {
  VocabularyLoaded(
      {required this.vocabularyList,
      required this.vocabularyListSearched,
      required this.language});
  List<WordCollection> vocabularyList;
  List<WordCollection> vocabularyListSearched;
  String language;

  @override
  List<Object> get props => [vocabularyList, vocabularyListSearched, language];
}

class VocabularyError extends VocabularyState {
  VocabularyError({required this.error});
  CustomError error;
  @override
  List<Object> get props => [error];
}

class VocabularyFlashCards extends VocabularyState {
  VocabularyFlashCards({required this.flashCards});
  List<FlashCardData> flashCards;
  @override
  List<Object> get props => [flashCards];
}
