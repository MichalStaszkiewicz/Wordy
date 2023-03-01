part of 'topics_bloc.dart';

abstract class TopicsState extends Equatable {
  const TopicsState();

  @override
  List<Object> get props => [];
}

class TopicsInitial extends TopicsState {
  TopicsInitial();
}

class TopicsLoaded extends TopicsState {
  TopicsLoaded({required  this.topics, required this.selectedTopic,required this.localPosition,required this.globalPosition,required  this.index,required this.topicsToReadFromDatabase});
  final List<Topic> topics;
  final List<String> topicsToReadFromDatabase;
  final bool selectedTopic;
  final Offset localPosition;
  final Offset globalPosition;

  final int index;



  @override
  List<Object> get props => [topics, selectedTopic,localPosition,globalPosition,index,topicsToReadFromDatabase];
}
