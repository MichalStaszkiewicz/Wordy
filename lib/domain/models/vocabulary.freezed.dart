// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vocabulary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Vocabulary _$VocabularyFromJson(Map<String, dynamic> json) {
  return _Vocabulary.fromJson(json);
}

/// @nodoc
mixin _$Vocabulary {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VocabularyCopyWith<$Res> {
  factory $VocabularyCopyWith(
          Vocabulary value, $Res Function(Vocabulary) then) =
      _$VocabularyCopyWithImpl<$Res, Vocabulary>;
}

/// @nodoc
class _$VocabularyCopyWithImpl<$Res, $Val extends Vocabulary>
    implements $VocabularyCopyWith<$Res> {
  _$VocabularyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_VocabularyCopyWith<$Res> {
  factory _$$_VocabularyCopyWith(
          _$_Vocabulary value, $Res Function(_$_Vocabulary) then) =
      __$$_VocabularyCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_VocabularyCopyWithImpl<$Res>
    extends _$VocabularyCopyWithImpl<$Res, _$_Vocabulary>
    implements _$$_VocabularyCopyWith<$Res> {
  __$$_VocabularyCopyWithImpl(
      _$_Vocabulary _value, $Res Function(_$_Vocabulary) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$_Vocabulary implements _Vocabulary {
  _$_Vocabulary();

  factory _$_Vocabulary.fromJson(Map<String, dynamic> json) =>
      _$$_VocabularyFromJson(json);

  @override
  String toString() {
    return 'Vocabulary()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Vocabulary);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$_VocabularyToJson(
      this,
    );
  }
}

abstract class _Vocabulary implements Vocabulary {
  factory _Vocabulary() = _$_Vocabulary;

  factory _Vocabulary.fromJson(Map<String, dynamic> json) =
      _$_Vocabulary.fromJson;
}
