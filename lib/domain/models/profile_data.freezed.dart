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
  int get knownWords => throw _privateConstructorUsedError;
  List<ActiveCourse> get vocabularyProgress =>
      throw _privateConstructorUsedError;
  List<UserAchievement> get achievements => throw _privateConstructorUsedError;
  int get hotStreak => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;

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
      int knownWords,
      List<ActiveCourse> vocabularyProgress,
      List<UserAchievement> achievements,
      int hotStreak,
      String fullName});
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
    Object? knownWords = null,
    Object? vocabularyProgress = null,
    Object? achievements = null,
    Object? hotStreak = null,
    Object? fullName = null,
  }) {
    return _then(_value.copyWith(
      finishedCourses: null == finishedCourses
          ? _value.finishedCourses
          : finishedCourses // ignore: cast_nullable_to_non_nullable
              as int,
      knownWords: null == knownWords
          ? _value.knownWords
          : knownWords // ignore: cast_nullable_to_non_nullable
              as int,
      vocabularyProgress: null == vocabularyProgress
          ? _value.vocabularyProgress
          : vocabularyProgress // ignore: cast_nullable_to_non_nullable
              as List<ActiveCourse>,
      achievements: null == achievements
          ? _value.achievements
          : achievements // ignore: cast_nullable_to_non_nullable
              as List<UserAchievement>,
      hotStreak: null == hotStreak
          ? _value.hotStreak
          : hotStreak // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
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
      int knownWords,
      List<ActiveCourse> vocabularyProgress,
      List<UserAchievement> achievements,
      int hotStreak,
      String fullName});
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
    Object? knownWords = null,
    Object? vocabularyProgress = null,
    Object? achievements = null,
    Object? hotStreak = null,
    Object? fullName = null,
  }) {
    return _then(_$_ProfileData(
      finishedCourses: null == finishedCourses
          ? _value.finishedCourses
          : finishedCourses // ignore: cast_nullable_to_non_nullable
              as int,
      knownWords: null == knownWords
          ? _value.knownWords
          : knownWords // ignore: cast_nullable_to_non_nullable
              as int,
      vocabularyProgress: null == vocabularyProgress
          ? _value._vocabularyProgress
          : vocabularyProgress // ignore: cast_nullable_to_non_nullable
              as List<ActiveCourse>,
      achievements: null == achievements
          ? _value._achievements
          : achievements // ignore: cast_nullable_to_non_nullable
              as List<UserAchievement>,
      hotStreak: null == hotStreak
          ? _value.hotStreak
          : hotStreak // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProfileData implements _ProfileData {
  _$_ProfileData(
      {required this.finishedCourses,
      required this.knownWords,
      required final List<ActiveCourse> vocabularyProgress,
      required final List<UserAchievement> achievements,
      required this.hotStreak,
      required this.fullName})
      : _vocabularyProgress = vocabularyProgress,
        _achievements = achievements;

  factory _$_ProfileData.fromJson(Map<String, dynamic> json) =>
      _$$_ProfileDataFromJson(json);

  @override
  final int finishedCourses;
  @override
  final int knownWords;
  final List<ActiveCourse> _vocabularyProgress;
  @override
  List<ActiveCourse> get vocabularyProgress {
    if (_vocabularyProgress is EqualUnmodifiableListView)
      return _vocabularyProgress;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vocabularyProgress);
  }

  final List<UserAchievement> _achievements;
  @override
  List<UserAchievement> get achievements {
    if (_achievements is EqualUnmodifiableListView) return _achievements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_achievements);
  }

  @override
  final int hotStreak;
  @override
  final String fullName;

  @override
  String toString() {
    return 'ProfileData(finishedCourses: $finishedCourses, knownWords: $knownWords, vocabularyProgress: $vocabularyProgress, achievements: $achievements, hotStreak: $hotStreak, fullName: $fullName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileData &&
            (identical(other.finishedCourses, finishedCourses) ||
                other.finishedCourses == finishedCourses) &&
            (identical(other.knownWords, knownWords) ||
                other.knownWords == knownWords) &&
            const DeepCollectionEquality()
                .equals(other._vocabularyProgress, _vocabularyProgress) &&
            const DeepCollectionEquality()
                .equals(other._achievements, _achievements) &&
            (identical(other.hotStreak, hotStreak) ||
                other.hotStreak == hotStreak) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      finishedCourses,
      knownWords,
      const DeepCollectionEquality().hash(_vocabularyProgress),
      const DeepCollectionEquality().hash(_achievements),
      hotStreak,
      fullName);

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
      required final int knownWords,
      required final List<ActiveCourse> vocabularyProgress,
      required final List<UserAchievement> achievements,
      required final int hotStreak,
      required final String fullName}) = _$_ProfileData;

  factory _ProfileData.fromJson(Map<String, dynamic> json) =
      _$_ProfileData.fromJson;

  @override
  int get finishedCourses;
  @override
  int get knownWords;
  @override
  List<ActiveCourse> get vocabularyProgress;
  @override
  List<UserAchievement> get achievements;
  @override
  int get hotStreak;
  @override
  String get fullName;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileDataCopyWith<_$_ProfileData> get copyWith =>
      throw _privateConstructorUsedError;
}
