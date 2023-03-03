part of 'vocabulary_bloc.dart';

abstract class VocabularyState extends Equatable {
  const VocabularyState();
  

  @override
  List<Object> get props => [];
}

class VocabularyInitial extends VocabularyState {}

class VocabularyLoaded extends VocabularyState {
  VocabularyLoaded(
      {required this.vocabularyList, required this.vocabularyListSearched,required this.language});
  List<Vocabulary> vocabularyList;
  List<Vocabulary> vocabularyListSearched;
  String language;


  @override
  List<Object> get props => [vocabularyList,vocabularyListSearched,language];
}
class VocabularyWordiesList extends VocabularyState{
VocabularyWordiesList({required this.questionList});
List<QuizQuestion> questionList;
@override
List<Object> get props => [questionList];
}