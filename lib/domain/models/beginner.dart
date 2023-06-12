import 'package:freezed_annotation/freezed_annotation.dart';

part 'beginner.freezed.dart';
part 'beginner.g.dart';

@freezed
class Beginner with _$Beginner {
  factory Beginner({required String name}) = _Beginner;

  factory Beginner.fromJson(Map<String, dynamic> json) =>
      _$BeginnerFromJson(json);
}
