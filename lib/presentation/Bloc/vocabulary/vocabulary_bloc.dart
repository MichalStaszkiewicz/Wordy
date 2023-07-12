import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wordy/data/network/exceptions/exception_helper.dart';
import 'package:wordy/domain/logic/user_service.dart';
import 'package:wordy/domain/models/custom_error.dart';
import 'package:wordy/const/consts.dart';
import 'package:wordy/domain/models/word_collection.dart';

import '../../../Utility/locator/service_locator.dart';
import '../../../domain/logic/vocabulary_logic.dart';
import '../../../domain/models/flash_card_data.dart';
import '../../../domain/models/topic.dart';
import '../../../domain/repositiories/repository.dart';

part 'vocabulary_event.dart';
part 'vocabulary_state.dart';

class VocabularyBloc extends Bloc<VocabularyEvent, VocabularyState> {
  final vocabService = locator<VocabularyService>();
  VocabularyBloc() : super(VocabularyInitial()) {
    loadVocabulary();
    updateVocabulary();
    showSpecificVocabularyList();
  }

  void loadVocabulary() {
    return on<LoadVocabulary>((event, emit) async {
      emit(VocabularyInitial());
      final course = await locator<UserService>().getUserCurrentCourse();
      final topics = await locator<Repository>().getTopics();
      final userInterfaceLanguage =
          await locator<UserService>().getUserInterfaceLanguage();
      if (userInterfaceLanguage.isError) {
        emit(VocabularyError(
            error:
                ExceptionHelper.getErrorMessage(userInterfaceLanguage.error!)));
      }
      if (topics.isError) {
        emit(VocabularyError(
            error: ExceptionHelper.getErrorMessage(topics.error!)));
      }
      if (course.isError) {
        emit(VocabularyError(
            error: ExceptionHelper.getErrorMessage(course.error!)));
      } else {
        List<WordCollection> list = [];
        for (Topic topic in topics.data!) {
          list.add(
            WordCollection(
              topic: ui_lang['english']!['topic_label'][topic.name],
              image: topic.image,
            ),
          );
        }
        emit(VocabularyLoaded(
            vocabularyList: list,
            vocabularyListSearched: list,
            language: course.data!.course.name));
      }
    });
  }

  void updateVocabulary() {
    return on<SearchForSpecificVocabulary>((event, emit) {
      List<WordCollection> updatedList = [];
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
      final userId = await locator<UserService>().getTokenAccess();

      if (userId.isError) {
        emit(VocabularyError(
            error: ExceptionHelper.getErrorMessage(userId.error!)));
      }
      final course = await locator<UserService>().getUserCurrentCourse();

      if (course.isError) {
        emit(VocabularyError(
            error: ExceptionHelper.getErrorMessage(course.error!)));
      }

      var flashCards =
          await vocabService.getVocabularyByTopic(event.topic, userId.data!);
      if (flashCards.isError) {
        emit(VocabularyError(
            error: ExceptionHelper.getErrorMessage(flashCards.error!)));
      } else {
        emit(VocabularyFlashCards(flashCards: flashCards.data!));
      }
    });
  }
}
