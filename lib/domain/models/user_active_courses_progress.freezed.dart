// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_active_courses_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserActiveCoursesProgress _$UserActiveCoursesProgressFromJson(
    Map<String, dynamic> json) {
  return _UserActiveCoursesProgress.fromJson(json);
}

/// @nodoc
mixin _$UserActiveCoursesProgress {
  List<ActiveCourse> get activeCourses => throw _privateConstructorUsedError;
  ActiveCourse get currentCourse => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserActiveCoursesProgressCopyWith<UserActiveCoursesProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserActiveCoursesProgressCopyWith<$Res> {
  factory $UserActiveCoursesProgressCopyWith(UserActiveCoursesProgress value,
          $Res Function(UserActiveCoursesProgress) then) =
      _$UserActiveCoursesProgressCopyWithImpl<$Res, UserActiveCoursesProgress>;
  @useResult
  $Res call({List<ActiveCourse> activeCourses, ActiveCourse currentCourse});

  $ActiveCourseCopyWith<$Res> get currentCourse;
}

/// @nodoc
class _$UserActiveCoursesProgressCopyWithImpl<$Res,
        $Val extends UserActiveCoursesProgress>
    implements $UserActiveCoursesProgressCopyWith<$Res> {
  _$UserActiveCoursesProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeCourses = null,
    Object? currentCourse = null,
  }) {
    return _then(_value.copyWith(
      activeCourses: null == activeCourses
          ? _value.activeCourses
          : activeCourses // ignore: cast_nullable_to_non_nullable
              as List<ActiveCourse>,
      currentCourse: null == currentCourse
          ? _value.currentCourse
          : currentCourse // ignore: cast_nullable_to_non_nullable
              as ActiveCourse,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ActiveCourseCopyWith<$Res> get currentCourse {
    return $ActiveCourseCopyWith<$Res>(_value.currentCourse, (value) {
      return _then(_value.copyWith(currentCourse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserActiveCoursesProgressCopyWith<$Res>
    implements $UserActiveCoursesProgressCopyWith<$Res> {
  factory _$$_UserActiveCoursesProgressCopyWith(
          _$_UserActiveCoursesProgress value,
          $Res Function(_$_UserActiveCoursesProgress) then) =
      __$$_UserActiveCoursesProgressCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ActiveCourse> activeCourses, ActiveCourse currentCourse});

  @override
  $ActiveCourseCopyWith<$Res> get currentCourse;
}

/// @nodoc
class __$$_UserActiveCoursesProgressCopyWithImpl<$Res>
    extends _$UserActiveCoursesProgressCopyWithImpl<$Res,
        _$_UserActiveCoursesProgress>
    implements _$$_UserActiveCoursesProgressCopyWith<$Res> {
  __$$_UserActiveCoursesProgressCopyWithImpl(
      _$_UserActiveCoursesProgress _value,
      $Res Function(_$_UserActiveCoursesProgress) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeCourses = null,
    Object? currentCourse = null,
  }) {
    return _then(_$_UserActiveCoursesProgress(
      activeCourses: null == activeCourses
          ? _value._activeCourses
          : activeCourses // ignore: cast_nullable_to_non_nullable
              as List<ActiveCourse>,
      currentCourse: null == currentCourse
          ? _value.currentCourse
          : currentCourse // ignore: cast_nullable_to_non_nullable
              as ActiveCourse,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserActiveCoursesProgress implements _UserActiveCoursesProgress {
  _$_UserActiveCoursesProgress(
      {required final List<ActiveCourse> activeCourses,
      required this.currentCourse})
      : _activeCourses = activeCourses;

  factory _$_UserActiveCoursesProgress.fromJson(Map<String, dynamic> json) =>
      _$$_UserActiveCoursesProgressFromJson(json);

  final List<ActiveCourse> _activeCourses;
  @override
  List<ActiveCourse> get activeCourses {
    if (_activeCourses is EqualUnmodifiableListView) return _activeCourses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activeCourses);
  }

  @override
  final ActiveCourse currentCourse;

  @override
  String toString() {
    return 'UserActiveCoursesProgress(activeCourses: $activeCourses, currentCourse: $currentCourse)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserActiveCoursesProgress &&
            const DeepCollectionEquality()
                .equals(other._activeCourses, _activeCourses) &&
            (identical(other.currentCourse, currentCourse) ||
                other.currentCourse == currentCourse));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_activeCourses), currentCourse);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserActiveCoursesProgressCopyWith<_$_UserActiveCoursesProgress>
      get copyWith => __$$_UserActiveCoursesProgressCopyWithImpl<
          _$_UserActiveCoursesProgress>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserActiveCoursesProgressToJson(
      this,
    );
  }
}

abstract class _UserActiveCoursesProgress implements UserActiveCoursesProgress {
  factory _UserActiveCoursesProgress(
          {required final List<ActiveCourse> activeCourses,
          required final ActiveCourse currentCourse}) =
      _$_UserActiveCoursesProgress;

  factory _UserActiveCoursesProgress.fromJson(Map<String, dynamic> json) =
      _$_UserActiveCoursesProgress.fromJson;

  @override
  List<ActiveCourse> get activeCourses;
  @override
  ActiveCourse get currentCourse;
  @override
  @JsonKey(ignore: true)
  _$$_UserActiveCoursesProgressCopyWith<_$_UserActiveCoursesProgress>
      get copyWith => throw _privateConstructorUsedError;
}
