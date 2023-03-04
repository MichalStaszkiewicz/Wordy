import 'package:equatable/equatable.dart';

class CourseEntry extends Equatable{
  CourseEntry({required this.translation,required this.word,required this.topic});
  String word;
  String translation;
  String topic;

  
  @override

  List<Object?> get props => [word,topic,translation];
 
}
