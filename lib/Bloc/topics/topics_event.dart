part of 'topics_bloc.dart';

abstract class TopicsEvent extends Equatable {
  const TopicsEvent();

  @override
  List<Object> get props => [];
}

class LoadTopics extends TopicsEvent {
  LoadTopics();
}

class ChooseSettingsForQuiz extends TopicsEvent {
  ChooseSettingsForQuiz(
      {required this.settingsOpen, required this.localPosition,required this.globalPosition});
  final bool settingsOpen;
  final Offset localPosition;
  final Offset globalPosition;
}
