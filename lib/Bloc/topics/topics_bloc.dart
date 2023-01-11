import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:wordy/models/topic.dart';

part 'topics_event.dart';
part 'topics_state.dart';

class TopicsBloc extends Bloc<TopicsEvent, TopicsState> {
  TopicsBloc() : super(TopicsInitial()) {
    loadTopics();
    settingsOfTheQuiz();
  }
  void loadTopics() {
    on<LoadTopics>((event, emit) {
      emit(TopicsLoaded(
          index: 0,
          topics: [
            Topic(name: "Information Technology", image: "assets/it.png"),
            Topic(name: "Travel", image: "assets/summer.png"),
            Topic(name: "Food And Cooking", image: "assets/cooking-pot.png"),
            Topic(name: "Basic Conversation", image: "assets/dailyusage.png"),
            Topic(name: "Travel", image: "assets/summer.png"),
            Topic(name: "Food And Cooking", image: "assets/cooking-pot.png"),
            Topic(name: "Basic Conversation", image: "assets/dailyusage.png"),
            Topic(name: "Travel", image: "assets/summer.png"),
            Topic(name: "Food And Cooking", image: "assets/cooking-pot.png"),
            Topic(name: "Basic Conversation", image: "assets/dailyusage.png"),
          ],
          localPosition: Offset(0, 0),
          globalPosition: Offset(0, 0),
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
            index: event.index));
      }
    });
  }
}
