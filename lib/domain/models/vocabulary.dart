import 'package:equatable/equatable.dart';

class Vocabulary extends Equatable{
  const Vocabulary(
      {required this.topic, required this.image, });
  final String topic;
  final String image;
  
  @override
  // TODO: implement props
  List<Object?> get props => [topic,image];

}
