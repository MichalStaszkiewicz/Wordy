// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progress_in_topic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProgressInTopic _$ProgressInTopicFromJson(Map<String, dynamic> json) {
  return _ProgressInTopic.fromJson(json);
}

/// @nodoc
mixin _$ProgressInTopic {
  String get name => throw _privateConstructorUsedError;
  int get knownWords => throw _privateConstructorUsedError;
  int get wordsCount => throw _privateConstructorUsedError;
  Topic get topic => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProgressInTopicCopyWith<ProgressInTopic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgressInTopicCopyWith<$Res> {
  factory $ProgressInTopicCopyWith(
          ProgressInTopic value, $Res Function(ProgressInTopic) then) =
      _$ProgressInTopicCopyWithImpl<$Res, ProgressInTopic>;
  @useResult
  $Res call({String name, int knownWords, int wordsCount, Topic topic});
}

/// @nodoc
class _$ProgressInTopicCopyWithImpl<$Res, $Val extends ProgressInTopic>
    implements $ProgressInTopicCopyWith<$Res> {
  _$ProgressInTopicCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? knownWords = null,
    Object? wordsCount = null,
    Object? topic = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      knownWords: null == knownWords
          ? _value.knownWords
          : knownWords // ignore: cast_nullable_to_non_nullable
              as int,
      wordsCount: null == wordsCount
          ? _value.wordsCount
          : wordsCount // ignore: cast_nullable_to_non_nullable
              as int,
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as Topic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProgressInTopicCopyWith<$Res>
    implements $ProgressInTopicCopyWith<$Res> {
  factory _$$_ProgressInTopicCopyWith(
          _$_ProgressInTopic value, $Res Function(_$_ProgressInTopic) then) =
      __$$_ProgressInTopicCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int knownWords, int wordsCount, Topic topic});
}

/// @nodoc
class __$$_ProgressInTopicCopyWithImpl<$Res>
    extends _$ProgressInTopicCopyWithImpl<$Res, _$_ProgressInTopic>
    implements _$$_ProgressInTopicCopyWith<$Res> {
  __$$_ProgressInTopicCopyWithImpl(
      _$_ProgressInTopic _value, $Res Function(_$_ProgressInTopic) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? knownWords = null,
    Object? wordsCount = null,
    Object? topic = null,
  }) {
    return _then(_$_ProgressInTopic(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      knownWords: null == knownWords
          ? _value.knownWords
          : knownWords // ignore: cast_nullable_to_non_nullable
              as int,
      wordsCount: null == wordsCount
          ? _value.wordsCount
          : wordsCount // ignore: cast_nullable_to_non_nullable
              as int,
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as Topic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProgressInTopic implements _ProgressInTopic {
  _$_ProgressInTopic(
      {required this.name,
      required this.knownWords,
      required this.wordsCount,
      required this.topic});

  factory _$_ProgressInTopic.fromJson(Map<String, dynamic> json) =>
      _$$_ProgressInTopicFromJson(json);

  @override
  final String name;
  @override
  final int knownWords;
  @override
  final int wordsCount;
  @override
  final Topic topic;

  @override
  String toString() {
    return 'ProgressInTopic(name: $name, knownWords: $knownWords, wordsCount: $wordsCount, topic: $topic)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProgressInTopic &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.knownWords, knownWords) ||
                other.knownWords == knownWords) &&
            (identical(other.wordsCount, wordsCount) ||
                other.wordsCount == wordsCount) &&
            (identical(other.topic, topic) || other.topic == topic));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, knownWords, wordsCount, topic);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProgressInTopicCopyWith<_$_ProgressInTopic> get copyWith =>
      __$$_ProgressInTopicCopyWithImpl<_$_ProgressInTopic>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProgressInTopicToJson(
      this,
    );
  }
}

abstract class _ProgressInTopic implements ProgressInTopic {
  factory _ProgressInTopic(
      {required final String name,
      required final int knownWords,
      required final int wordsCount,
      required final Topic topic}) = _$_ProgressInTopic;

  factory _ProgressInTopic.fromJson(Map<String, dynamic> json) =
      _$_ProgressInTopic.fromJson;

  @override
  String get name;
  @override
  int get knownWords;
  @override
  int get wordsCount;
  @override
  Topic get topic;
  @override
  @JsonKey(ignore: true)
  _$$_ProgressInTopicCopyWith<_$_ProgressInTopic> get copyWith =>
      throw _privateConstructorUsedError;
}
