import 'package:equatable/equatable.dart';

class Course extends Equatable{
  Course({required this.translation,required this.word,required this.topic});
  String word;
  String translation;
  String topic;
  
  @override

  List<Object?> get props => [word,topic,translation];
 
}
