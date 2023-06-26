// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'active_course.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ActiveCourse _$ActiveCourseFromJson(Map<String, dynamic> json) {
  return _ActiveCourse.fromJson(json);
}

/// @nodoc
mixin _$ActiveCourse {
  UserCourse get userCourse => throw _privateConstructorUsedError;
  int get finishedTopics => throw _privateConstructorUsedError;
  int get knownWords => throw _privateConstructorUsedError;
  double get totalProgress => throw _privateConstructorUsedError;
  int get topicsCount => throw _privateConstructorUsedError;
  List<ProgressInTopic> get topicProgress => throw _privateConstructorUsedError;
  int get totalWordsCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActiveCourseCopyWith<ActiveCourse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActiveCourseCopyWith<$Res> {
  factory $ActiveCourseCopyWith(
          ActiveCourse value, $Res Function(ActiveCourse) then) =
      _$ActiveCourseCopyWithImpl<$Res, ActiveCourse>;
  @useResult
  $Res call(
      {UserCourse userCourse,
      int finishedTopics,
      int knownWords,
      double totalProgress,
      int topicsCount,
      List<ProgressInTopic> topicProgress,
      int totalWordsCount});

  $UserCourseCopyWith<$Res> get userCourse;
}

/// @nodoc
class _$ActiveCourseCopyWithImpl<$Res, $Val extends ActiveCourse>
    implements $ActiveCourseCopyWith<$Res> {
  _$ActiveCourseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userCourse = null,
    Object? finishedTopics = null,
    Object? knownWords = null,
    Object? totalProgress = null,
    Object? topicsCount = null,
    Object? topicProgress = null,
    Object? totalWordsCount = null,
  }) {
    return _then(_value.copyWith(
      userCourse: null == userCourse
          ? _value.userCourse
          : userCourse // ignore: cast_nullable_to_non_nullable
              as UserCourse,
      finishedTopics: null == finishedTopics
          ? _value.finishedTopics
          : finishedTopics // ignore: cast_nullable_to_non_nullable
              as int,
      knownWords: null == knownWords
          ? _value.knownWords
          : knownWords // ignore: cast_nullable_to_non_nullable
              as int,
      totalProgress: null == totalProgress
          ? _value.totalProgress
          : totalProgress // ignore: cast_nullable_to_non_nullable
              as double,
      topicsCount: null == topicsCount
          ? _value.topicsCount
          : topicsCount // ignore: cast_nullable_to_non_nullable
              as int,
      topicProgress: null == topicProgress
          ? _value.topicProgress
          : topicProgress // ignore: cast_nullable_to_non_nullable
              as List<ProgressInTopic>,
      totalWordsCount: null == totalWordsCount
          ? _value.totalWordsCount
          : totalWordsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCourseCopyWith<$Res> get userCourse {
    return $UserCourseCopyWith<$Res>(_value.userCourse, (value) {
      return _then(_value.copyWith(userCourse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ActiveCourseCopyWith<$Res>
    implements $ActiveCourseCopyWith<$Res> {
  factory _$$_ActiveCourseCopyWith(
          _$_ActiveCourse value, $Res Function(_$_ActiveCourse) then) =
      __$$_ActiveCourseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserCourse userCourse,
      int finishedTopics,
      int knownWords,
      double totalProgress,
      int topicsCount,
      List<ProgressInTopic> topicProgress,
      int totalWordsCount});

  @override
  $UserCourseCopyWith<$Res> get userCourse;
}

/// @nodoc
class __$$_ActiveCourseCopyWithImpl<$Res>
    extends _$ActiveCourseCopyWithImpl<$Res, _$_ActiveCourse>
    implements _$$_ActiveCourseCopyWith<$Res> {
  __$$_ActiveCourseCopyWithImpl(
      _$_ActiveCourse _value, $Res Function(_$_ActiveCourse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userCourse = null,
    Object? finishedTopics = null,
    Object? knownWords = null,
    Object? totalProgress = null,
    Object? topicsCount = null,
    Object? topicProgress = null,
    Object? totalWordsCount = null,
  }) {
    return _then(_$_ActiveCourse(
      userCourse: null == userCourse
          ? _value.userCourse
          : userCourse // ignore: cast_nullable_to_non_nullable
              as UserCourse,
      finishedTopics: null == finishedTopics
          ? _value.finishedTopics
          : finishedTopics // ignore: cast_nullable_to_non_nullable
              as int,
      knownWords: null == knownWords
          ? _value.knownWords
          : knownWords // ignore: cast_nullable_to_non_nullable
              as int,
      totalProgress: null == totalProgress
          ? _value.totalProgress
          : totalProgress // ignore: cast_nullable_to_non_nullable
              as double,
      topicsCount: null == topicsCount
          ? _value.topicsCount
          : topicsCount // ignore: cast_nullable_to_non_nullable
              as int,
      topicProgress: null == topicProgress
          ? _value._topicProgress
          : topicProgress // ignore: cast_nullable_to_non_nullable
              as List<ProgressInTopic>,
      totalWordsCount: null == totalWordsCount
          ? _value.totalWordsCount
          : totalWordsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ActiveCourse implements _ActiveCourse {
  _$_ActiveCourse(
      {required this.userCourse,
      required this.finishedTopics,
      required this.knownWords,
      required this.totalProgress,
      required this.topicsCount,
      required final List<ProgressInTopic> topicProgress,
      required this.totalWordsCount})
      : _topicProgress = topicProgress;

  factory _$_ActiveCourse.fromJson(Map<String, dynamic> json) =>
      _$$_ActiveCourseFromJson(json);

  @override
  final UserCourse userCourse;
  @override
  final int finishedTopics;
  @override
  final int knownWords;
  @override
  final double totalProgress;
  @override
  final int topicsCount;
  final List<ProgressInTopic> _topicProgress;
  @override
  List<ProgressInTopic> get topicProgress {
    if (_topicProgress is EqualUnmodifiableListView) return _topicProgress;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topicProgress);
  }

  @override
  final int totalWordsCount;

  @override
  String toString() {
    return 'ActiveCourse(userCourse: $userCourse, finishedTopics: $finishedTopics, knownWords: $knownWords, totalProgress: $totalProgress, topicsCount: $topicsCount, topicProgress: $topicProgress, totalWordsCount: $totalWordsCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ActiveCourse &&
            (identical(other.userCourse, userCourse) ||
                other.userCourse == userCourse) &&
            (identical(other.finishedTopics, finishedTopics) ||
                other.finishedTopics == finishedTopics) &&
            (identical(other.knownWords, knownWords) ||
                other.knownWords == knownWords) &&
            (identical(other.totalProgress, totalProgress) ||
                other.totalProgress == totalProgress) &&
            (identical(other.topicsCount, topicsCount) ||
                other.topicsCount == topicsCount) &&
            const DeepCollectionEquality()
                .equals(other._topicProgress, _topicProgress) &&
            (identical(other.totalWordsCount, totalWordsCount) ||
                other.totalWordsCount == totalWordsCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userCourse,
      finishedTopics,
      knownWords,
      totalProgress,
      topicsCount,
      const DeepCollectionEquality().hash(_topicProgress),
      totalWordsCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ActiveCourseCopyWith<_$_ActiveCourse> get copyWith =>
      __$$_ActiveCourseCopyWithImpl<_$_ActiveCourse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ActiveCourseToJson(
      this,
    );
  }
}

abstract class _ActiveCourse implements ActiveCourse {
  factory _ActiveCourse(
      {required final UserCourse userCourse,
      required final int finishedTopics,
      required final int knownWords,
      required final double totalProgress,
      required final int topicsCount,
      required final List<ProgressInTopic> topicProgress,
      required final int totalWordsCount}) = _$_ActiveCourse;

  factory _ActiveCourse.fromJson(Map<String, dynamic> json) =
      _$_ActiveCourse.fromJson;

  @override
  UserCourse get userCourse;
  @override
  int get finishedTopics;
  @override
  int get knownWords;
  @override
  double get totalProgress;
  @override
  int get topicsCount;
  @override
  List<ProgressInTopic> get topicProgress;
  @override
  int get totalWordsCount;
  @override
  @JsonKey(ignore: true)
  _$$_ActiveCourseCopyWith<_$_ActiveCourse> get copyWith =>
      throw _privateConstructorUsedError;
}
