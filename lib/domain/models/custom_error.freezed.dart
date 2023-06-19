// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CustomError {
  String get title => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get critical => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomErrorCopyWith<CustomError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomErrorCopyWith<$Res> {
  factory $CustomErrorCopyWith(
          CustomError value, $Res Function(CustomError) then) =
      _$CustomErrorCopyWithImpl<$Res, CustomError>;
  @useResult
  $Res call({String title, String message, bool critical});
}

/// @nodoc
class _$CustomErrorCopyWithImpl<$Res, $Val extends CustomError>
    implements $CustomErrorCopyWith<$Res> {
  _$CustomErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? message = null,
    Object? critical = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      critical: null == critical
          ? _value.critical
          : critical // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CustomErrorCopyWith<$Res>
    implements $CustomErrorCopyWith<$Res> {
  factory _$$_CustomErrorCopyWith(
          _$_CustomError value, $Res Function(_$_CustomError) then) =
      __$$_CustomErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String message, bool critical});
}

/// @nodoc
class __$$_CustomErrorCopyWithImpl<$Res>
    extends _$CustomErrorCopyWithImpl<$Res, _$_CustomError>
    implements _$$_CustomErrorCopyWith<$Res> {
  __$$_CustomErrorCopyWithImpl(
      _$_CustomError _value, $Res Function(_$_CustomError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? message = null,
    Object? critical = null,
  }) {
    return _then(_$_CustomError(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      critical: null == critical
          ? _value.critical
          : critical // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_CustomError implements _CustomError {
  const _$_CustomError(
      {required this.title, required this.message, required this.critical});

  @override
  final String title;
  @override
  final String message;
  @override
  final bool critical;

  @override
  String toString() {
    return 'CustomError(title: $title, message: $message, critical: $critical)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomError &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.critical, critical) ||
                other.critical == critical));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, message, critical);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomErrorCopyWith<_$_CustomError> get copyWith =>
      __$$_CustomErrorCopyWithImpl<_$_CustomError>(this, _$identity);
}

abstract class _CustomError implements CustomError {
  const factory _CustomError(
      {required final String title,
      required final String message,
      required final bool critical}) = _$_CustomError;

  @override
  String get title;
  @override
  String get message;
  @override
  bool get critical;
  @override
  @JsonKey(ignore: true)
  _$$_CustomErrorCopyWith<_$_CustomError> get copyWith =>
      throw _privateConstructorUsedError;
}
