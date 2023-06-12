// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CourseListResponse _$CourseListResponseFromJson(Map<String, dynamic> json) {
  return _CourseListResponse.fromJson(json);
}

/// @nodoc
mixin _$CourseListResponse {
  List<Course> get courses => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourseListResponseCopyWith<CourseListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseListResponseCopyWith<$Res> {
  factory $CourseListResponseCopyWith(
          CourseListResponse value, $Res Function(CourseListResponse) then) =
      _$CourseListResponseCopyWithImpl<$Res, CourseListResponse>;
  @useResult
  $Res call({List<Course> courses});
}

/// @nodoc
class _$CourseListResponseCopyWithImpl<$Res, $Val extends CourseListResponse>
    implements $CourseListResponseCopyWith<$Res> {
  _$CourseListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courses = null,
  }) {
    return _then(_value.copyWith(
      courses: null == courses
          ? _value.courses
          : courses // ignore: cast_nullable_to_non_nullable
              as List<Course>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CourseListResponseCopyWith<$Res>
    implements $CourseListResponseCopyWith<$Res> {
  factory _$$_CourseListResponseCopyWith(_$_CourseListResponse value,
          $Res Function(_$_CourseListResponse) then) =
      __$$_CourseListResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Course> courses});
}

/// @nodoc
class __$$_CourseListResponseCopyWithImpl<$Res>
    extends _$CourseListResponseCopyWithImpl<$Res, _$_CourseListResponse>
    implements _$$_CourseListResponseCopyWith<$Res> {
  __$$_CourseListResponseCopyWithImpl(
      _$_CourseListResponse _value, $Res Function(_$_CourseListResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courses = null,
  }) {
    return _then(_$_CourseListResponse(
      courses: null == courses
          ? _value._courses
          : courses // ignore: cast_nullable_to_non_nullable
              as List<Course>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CourseListResponse implements _CourseListResponse {
  const _$_CourseListResponse({required final List<Course> courses})
      : _courses = courses;

  factory _$_CourseListResponse.fromJson(Map<String, dynamic> json) =>
      _$$_CourseListResponseFromJson(json);

  final List<Course> _courses;
  @override
  List<Course> get courses {
    if (_courses is EqualUnmodifiableListView) return _courses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_courses);
  }

  @override
  String toString() {
    return 'CourseListResponse(courses: $courses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CourseListResponse &&
            const DeepCollectionEquality().equals(other._courses, _courses));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_courses));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CourseListResponseCopyWith<_$_CourseListResponse> get copyWith =>
      __$$_CourseListResponseCopyWithImpl<_$_CourseListResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CourseListResponseToJson(
      this,
    );
  }
}

abstract class _CourseListResponse implements CourseListResponse {
  const factory _CourseListResponse({required final List<Course> courses}) =
      _$_CourseListResponse;

  factory _CourseListResponse.fromJson(Map<String, dynamic> json) =
      _$_CourseListResponse.fromJson;

  @override
  List<Course> get courses;
  @override
  @JsonKey(ignore: true)
  _$$_CourseListResponseCopyWith<_$_CourseListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
