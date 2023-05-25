import 'package:equatable/equatable.dart';

class LearnedWord extends Equatable {
  LearnedWord({required this.question, required this.answer});
  String question;
  String answer;

  @override
  List<Object?> get props => [question, answer];
}
