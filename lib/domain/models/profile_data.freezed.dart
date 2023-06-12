// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProfileData _$ProfileDataFromJson(Map<String, dynamic> json) {
  return _ProfileData.fromJson(json);
}

/// @nodoc
mixin _$ProfileData {
  int get finishedCourses => throw _privateConstructorUsedError;
  int get learnedWords => throw _privateConstructorUsedError;
  List<ActiveCourse> get beginnerProgress => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileDataCopyWith<ProfileData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileDataCopyWith<$Res> {
  factory $ProfileDataCopyWith(
          ProfileData value, $Res Function(ProfileData) then) =
      _$ProfileDataCopyWithImpl<$Res, ProfileData>;
  @useResult
  $Res call(
      {int finishedCourses,
      int learnedWords,
      List<ActiveCourse> beginnerProgress});
}

/// @nodoc
class _$ProfileDataCopyWithImpl<$Res, $Val extends ProfileData>
    implements $ProfileDataCopyWith<$Res> {
  _$ProfileDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? finishedCourses = null,
    Object? learnedWords = null,
    Object? beginnerProgress = null,
  }) {
    return _then(_value.copyWith(
      finishedCourses: null == finishedCourses
          ? _value.finishedCourses
          : finishedCourses // ignore: cast_nullable_to_non_nullable
              as int,
      learnedWords: null == learnedWords
          ? _value.learnedWords
          : learnedWords // ignore: cast_nullable_to_non_nullable
              as int,
      beginnerProgress: null == beginnerProgress
          ? _value.beginnerProgress
          : beginnerProgress // ignore: cast_nullable_to_non_nullable
              as List<ActiveCourse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProfileDataCopyWith<$Res>
    implements $ProfileDataCopyWith<$Res> {
  factory _$$_ProfileDataCopyWith(
          _$_ProfileData value, $Res Function(_$_ProfileData) then) =
      __$$_ProfileDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int finishedCourses,
      int learnedWords,
      List<ActiveCourse> beginnerProgress});
}

/// @nodoc
class __$$_ProfileDataCopyWithImpl<$Res>
    extends _$ProfileDataCopyWithImpl<$Res, _$_ProfileData>
    implements _$$_ProfileDataCopyWith<$Res> {
  __$$_ProfileDataCopyWithImpl(
      _$_ProfileData _value, $Res Function(_$_ProfileData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? finishedCourses = null,
    Object? learnedWords = null,
    Object? beginnerProgress = null,
  }) {
    return _then(_$_ProfileData(
      finishedCourses: null == finishedCourses
          ? _value.finishedCourses
          : finishedCourses // ignore: cast_nullable_to_non_nullable
              as int,
      learnedWords: null == learnedWords
          ? _value.learnedWords
          : learnedWords // ignore: cast_nullable_to_non_nullable
              as int,
      beginnerProgress: null == beginnerProgress
          ? _value._beginnerProgress
          : beginnerProgress // ignore: cast_nullable_to_non_nullable
              as List<ActiveCourse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProfileData implements _ProfileData {
  _$_ProfileData(
      {required this.finishedCourses,
      required this.learnedWords,
      required final List<ActiveCourse> beginnerProgress})
      : _beginnerProgress = beginnerProgress;

  factory _$_ProfileData.fromJson(Map<String, dynamic> json) =>
      _$$_ProfileDataFromJson(json);

  @override
  final int finishedCourses;
  @override
  final int learnedWords;
  final List<ActiveCourse> _beginnerProgress;
  @override
  List<ActiveCourse> get beginnerProgress {
    if (_beginnerProgress is EqualUnmodifiableListView)
      return _beginnerProgress;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_beginnerProgress);
  }

  @override
  String toString() {
    return 'ProfileData(finishedCourses: $finishedCourses, learnedWords: $learnedWords, beginnerProgress: $beginnerProgress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileData &&
            (identical(other.finishedCourses, finishedCourses) ||
                other.finishedCourses == finishedCourses) &&
            (identical(other.learnedWords, learnedWords) ||
                other.learnedWords == learnedWords) &&
            const DeepCollectionEquality()
                .equals(other._beginnerProgress, _beginnerProgress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, finishedCourses, learnedWords,
      const DeepCollectionEquality().hash(_beginnerProgress));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileDataCopyWith<_$_ProfileData> get copyWith =>
      __$$_ProfileDataCopyWithImpl<_$_ProfileData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProfileDataToJson(
      this,
    );
  }
}

abstract class _ProfileData implements ProfileData {
  factory _ProfileData(
      {required final int finishedCourses,
      required final int learnedWords,
      required final List<ActiveCourse> beginnerProgress}) = _$_ProfileData;

  factory _ProfileData.fromJson(Map<String, dynamic> json) =
      _$_ProfileData.fromJson;

  @override
  int get finishedCourses;
  @override
  int get learnedWords;
  @override
  List<ActiveCourse> get beginnerProgress;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileDataCopyWith<_$_ProfileData> get copyWith =>
      throw _privateConstructorUsedError;
}