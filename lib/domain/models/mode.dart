import 'package:freezed_annotation/freezed_annotation.dart';
import 'vocabulary.dart';

part 'mode.freezed.dart';
part 'mode.g.dart';

@freezed
class Mode with _$Mode {
  factory Mode({required Vocabulary vocabulary}) = _Mode;
  factory Mode.fromJson(Map<String, dynamic> json) => _$ModeFromJson(json);
}
