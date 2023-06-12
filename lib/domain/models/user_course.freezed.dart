// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_course.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserCourse _$UserCourseFromJson(Map<String, dynamic> json) {
  return _UserCourse.fromJson(json);
}

/// @nodoc
mixin _$UserCourse {
  Course get course => throw _privateConstructorUsedError;
  Difficulty get difficulty => throw _privateConstructorUsedError;
  InterfaceLanguage get interfaceLanguage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCourseCopyWith<UserCourse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCourseCopyWith<$Res> {
  factory $UserCourseCopyWith(
          UserCourse value, $Res Function(UserCourse) then) =
      _$UserCourseCopyWithImpl<$Res, UserCourse>;
  @useResult
  $Res call(
      {Course course,
      Difficulty difficulty,
      InterfaceLanguage interfaceLanguage});

  $CourseCopyWith<$Res> get course;
  $DifficultyCopyWith<$Res> get difficulty;
  $InterfaceLanguageCopyWith<$Res> get interfaceLanguage;
}

/// @nodoc
class _$UserCourseCopyWithImpl<$Res, $Val extends UserCourse>
    implements $UserCourseCopyWith<$Res> {
  _$UserCourseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? course = null,
    Object? difficulty = null,
    Object? interfaceLanguage = null,
  }) {
    return _then(_value.copyWith(
      course: null == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as Course,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as Difficulty,
      interfaceLanguage: null == interfaceLanguage
          ? _value.interfaceLanguage
          : interfaceLanguage // ignore: cast_nullable_to_non_nullable
              as InterfaceLanguage,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CourseCopyWith<$Res> get course {
    return $CourseCopyWith<$Res>(_value.course, (value) {
      return _then(_value.copyWith(course: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DifficultyCopyWith<$Res> get difficulty {
    return $DifficultyCopyWith<$Res>(_value.difficulty, (value) {
      return _then(_value.copyWith(difficulty: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $InterfaceLanguageCopyWith<$Res> get interfaceLanguage {
    return $InterfaceLanguageCopyWith<$Res>(_value.interfaceLanguage, (value) {
      return _then(_value.copyWith(interfaceLanguage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserCourseCopyWith<$Res>
    implements $UserCourseCopyWith<$Res> {
  factory _$$_UserCourseCopyWith(
          _$_UserCourse value, $Res Function(_$_UserCourse) then) =
      __$$_UserCourseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Course course,
      Difficulty difficulty,
      InterfaceLanguage interfaceLanguage});

  @override
  $CourseCopyWith<$Res> get course;
  @override
  $DifficultyCopyWith<$Res> get difficulty;
  @override
  $InterfaceLanguageCopyWith<$Res> get interfaceLanguage;
}

/// @nodoc
class __$$_UserCourseCopyWithImpl<$Res>
    extends _$UserCourseCopyWithImpl<$Res, _$_UserCourse>
    implements _$$_UserCourseCopyWith<$Res> {
  __$$_UserCourseCopyWithImpl(
      _$_UserCourse _value, $Res Function(_$_UserCourse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? course = null,
    Object? difficulty = null,
    Object? interfaceLanguage = null,
  }) {
    return _then(_$_UserCourse(
      course: null == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as Course,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as Difficulty,
      interfaceLanguage: null == interfaceLanguage
          ? _value.interfaceLanguage
          : interfaceLanguage // ignore: cast_nullable_to_non_nullable
              as InterfaceLanguage,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserCourse implements _UserCourse {
  _$_UserCourse(
      {required this.course,
      required this.difficulty,
      required this.interfaceLanguage});

  factory _$_UserCourse.fromJson(Map<String, dynamic> json) =>
      _$$_UserCourseFromJson(json);

  @override
  final Course course;
  @override
  final Difficulty difficulty;
  @override
  final InterfaceLanguage interfaceLanguage;

  @override
  String toString() {
    return 'UserCourse(course: $course, difficulty: $difficulty, interfaceLanguage: $interfaceLanguage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserCourse &&
            (identical(other.course, course) || other.course == course) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.interfaceLanguage, interfaceLanguage) ||
                other.interfaceLanguage == interfaceLanguage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, course, difficulty, interfaceLanguage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCourseCopyWith<_$_UserCourse> get copyWith =>
      __$$_UserCourseCopyWithImpl<_$_UserCourse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserCourseToJson(
      this,
    );
  }
}

abstract class _UserCourse implements UserCourse {
  factory _UserCourse(
      {required final Course course,
      required final Difficulty difficulty,
      required final InterfaceLanguage interfaceLanguage}) = _$_UserCourse;

  factory _UserCourse.fromJson(Map<String, dynamic> json) =
      _$_UserCourse.fromJson;

  @override
  Course get course;
  @override
  Difficulty get difficulty;
  @override
  InterfaceLanguage get interfaceLanguage;
  @override
  @JsonKey(ignore: true)
  _$$_UserCourseCopyWith<_$_UserCourse> get copyWith =>
      throw _privateConstructorUsedError;
}
