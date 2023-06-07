import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wordy/data/network/exceptions/exception_helper.dart';
import 'package:wordy/domain/logic/user_service.dart';
import 'package:wordy/domain/models/custom_error.dart';
import 'package:wordy/domain/models/interface_language.dart';
import 'package:wordy/domain/models/word.dart';
import 'package:wordy/const/consts.dart';
import 'package:wordy/domain/repositiories/user_repository.dart';

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
    return on<LoadVocabulary>((event, emit) async {
      emit(VocabularyInitial());
      final course = await locator<UserService>().getUserCurrentCourse();
      if (course.isLeft) {
        emit(VocabularyError(
            error: ExceptionHelper.getErrorMessage(course.left!)));
      }

      List<Vocabulary> list = [
        Vocabulary(
          topic: ui_lang[course.right!.interfaceLanguage.name]!['topic_label']
              [0],
          image: "assets/dailyusage.png",
        ),
      ];

      emit(VocabularyLoaded(
          vocabularyList: list,
          vocabularyListSearched: list,
          language: course.right!.interfaceLanguage.name));
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
      final vocabService = locator<VocabularyService>();
      final userId = await locator<UserRepository>().getUserId();

      if (userId.isLeft) {
        emit(VocabularyError(
            error: ExceptionHelper.getErrorMessage(userId.left!)));
      }
      final course =
          await locator<UserRepository>().getUserCurrentCourse(userId.right!);

      if (course.isLeft) {
        emit(VocabularyError(
            error: ExceptionHelper.getErrorMessage(course.left!)));
      }

      var flashCards =
          await vocabService.getVocabularyByTopic(event.topic, userId.right!);
      if (flashCards.isLeft) {
        emit(VocabularyError(
            error: ExceptionHelper.getErrorMessage(flashCards.left!)));
      } else {
        emit(VocabularyFlashCards(flashCards: flashCards.right!));
      }
    });
  }
}
