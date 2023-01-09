import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wordy/models/vocabulary.dart';

part 'vocabulary_event.dart';
part 'vocabulary_state.dart';

class VocabularyBloc extends Bloc<VocabularyEvent, VocabularyState> {
  VocabularyBloc() : super(VocabularyInitial()) {
    loadVocabulary();
    updateVocabulary();
  }

  void loadVocabulary() {
    return on<LoadVocabulary>((event, emit) {
      List<Vocabulary> list = [
        Vocabulary(
            topic: "Basic Conversation",
            image: "assets/dailyusage.png",
            percentage: 60),
        Vocabulary(
            topic: "Information Technology",
            image: "assets/it.png",
            percentage: 20),
        Vocabulary(
            topic: "Travel", image: "assets/summer.png", percentage: 100),
        Vocabulary(
            topic: "Food And Cooking",
            image: "assets/cooking-pot.png",
            percentage: 40),
      ];
      emit(
          VocabularyLoaded(vocabularyList: list, vocabularyListSearched: list));
    });
  }

  void updateVocabulary() {
    return on<SearchForSpecificVocabulary>((event, emit) {
      List<Vocabulary> updatedList = [];
      if (state is VocabularyLoaded) {
        final state = this.state as VocabularyLoaded;
        for (int i = 0; i < state.vocabularyList.length; i++) {
          if (state.vocabularyList[i].topic
              .toLowerCase()
              .contains(event.text.toLowerCase())) {
            updatedList.add(state.vocabularyList[i]);
          }
        }
        emit(VocabularyLoaded(
            vocabularyList: state.vocabularyList,
            vocabularyListSearched: updatedList));
      }
    });
  }
}
