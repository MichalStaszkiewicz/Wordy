part of 'topics_bloc.dart';

abstract class TopicsEvent extends Equatable {
  const TopicsEvent();

  @override
  List<Object> get props => [];
}

class LoadTopics extends TopicsEvent {
  const LoadTopics({required this.language});
    final String language;
}

class ChooseSettingsForQuiz extends TopicsEvent {
  const ChooseSettingsForQuiz(
      {required this.settingsOpen, required this.localPosition,required this.globalPosition,required this.index});
  final bool settingsOpen;
  final Offset localPosition;
  final Offset globalPosition;
  final int index;
}
