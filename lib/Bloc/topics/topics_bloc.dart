import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wordy/models/topic.dart';

part 'topics_event.dart';
part 'topics_state.dart';

class TopicsBloc extends Bloc<TopicsEvent, TopicsState> {
  TopicsBloc() : super(TopicsInitial()) {
    on<LoadTopics>((event, emit) {
      emit(TopicsLoaded(topics: [
        Topic(name: "Information Technology", image: "assets/it.png"),
        Topic(name: "Travel", image: "assets/summer.png"),
        Topic(name: "Food And Cooking", image: "assets/cooking-pot.png"),
        Topic(name: "Basic Conversation", image: "assets/dailyusage.png"),
      ]));
    });
  }
}
