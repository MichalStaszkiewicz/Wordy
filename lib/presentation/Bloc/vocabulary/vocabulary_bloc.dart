import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wordy/domain/models/word.dart';
import 'package:wordy/const/consts.dart';

import '../../../domain/logic/vocabulary_logic.dart';
import '../../../domain/models/flash_card_data.dart';
import '../../../domain/models/quiz_question.dart';
import '../../../domain/models/vocabulary.dart';
import '../../../utility/locator/api_locator.dart';

part 'vocabulary_event.dart';
part 'vocabulary_state.dart';

class VocabularyBloc extends Bloc<VocabularyEvent, VocabularyState> {
  VocabularyBloc() : super(VocabularyInitial()) {
    loadVocabulary();
    updateVocabulary();
    showSpecificVocabularyList();
  }

  void loadVocabulary() {
    return on<LoadVocabulary>((event, emit) {
      List<Vocabulary> list = [
        Vocabulary(
          topic: ui_lang[event.language]!['topic_label'][0],
          image: "assets/dailyusage.png",
        ),
      ];
      emit(VocabularyLoaded(
          vocabularyList: list,
          vocabularyListSearched: list,
          language: event.language));
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
          vocabularyListSearched: updatedList,
          language: state.language,
        ));
      }
    });
  }

  void showSpecificVocabularyList() {
    on<ListVocabularyWordsByTopic>((event, emit) async {
      final vocabLogic = locator<VocabularyLogic>();
      emit(VocabularyFlashCards(
          flashCards: await vocabLogic.getVocabularyByTopic(event.topic)));
    });
  }
}
