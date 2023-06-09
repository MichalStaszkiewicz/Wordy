import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:wordy/const/consts.dart';

import '../../../domain/models/topic.dart';

part 'topics_event.dart';
part 'topics_state.dart';

class TopicsBloc extends Bloc<TopicsEvent, TopicsState> {
  TopicsBloc() : super(const TopicsInitial()) {
    loadTopics();
    settingsOfTheQuiz();
  }
  void loadTopics() {
    on<LoadTopics>((event, emit) async {
      emit(TopicsLoaded(
          index: 0,
          topics: [
            Topic(
              name: ui_lang[event.language]!['topic_label'][0],
            ),
          ],
          topicsToReadFromDatabase: const ["Basic Conversation"],
          localPosition: const Offset(0, 0),
          globalPosition: const Offset(0, 0),
          selectedTopic: false));
    });
  }

  void settingsOfTheQuiz() {
    on<ChooseSettingsForQuiz>((event, emit) {
      if (state is TopicsLoaded) {
        final state = this.state as TopicsLoaded;
        emit(TopicsLoaded(
            topics: state.topics,
            selectedTopic: event.settingsOpen,
            localPosition: event.localPosition,
            globalPosition: event.globalPosition,
            index: event.index,
            topicsToReadFromDatabase: state.topicsToReadFromDatabase));
      }
    });
  }
}
