// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'beginner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Beginner _$BeginnerFromJson(Map<String, dynamic> json) {
  return _Beginner.fromJson(json);
}

/// @nodoc
mixin _$Beginner {
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BeginnerCopyWith<Beginner> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeginnerCopyWith<$Res> {
  factory $BeginnerCopyWith(Beginner value, $Res Function(Beginner) then) =
      _$BeginnerCopyWithImpl<$Res, Beginner>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$BeginnerCopyWithImpl<$Res, $Val extends Beginner>
    implements $BeginnerCopyWith<$Res> {
  _$BeginnerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BeginnerCopyWith<$Res> implements $BeginnerCopyWith<$Res> {
  factory _$$_BeginnerCopyWith(
          _$_Beginner value, $Res Function(_$_Beginner) then) =
      __$$_BeginnerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$_BeginnerCopyWithImpl<$Res>
    extends _$BeginnerCopyWithImpl<$Res, _$_Beginner>
    implements _$$_BeginnerCopyWith<$Res> {
  __$$_BeginnerCopyWithImpl(
      _$_Beginner _value, $Res Function(_$_Beginner) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$_Beginner(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Beginner implements _Beginner {
  _$_Beginner({required this.name});

  factory _$_Beginner.fromJson(Map<String, dynamic> json) =>
      _$$_BeginnerFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'Beginner(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Beginner &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeginnerCopyWith<_$_Beginner> get copyWith =>
      __$$_BeginnerCopyWithImpl<_$_Beginner>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BeginnerToJson(
      this,
    );
  }
}

abstract class _Beginner implements Beginner {
  factory _Beginner({required final String name}) = _$_Beginner;

  factory _Beginner.fromJson(Map<String, dynamic> json) = _$_Beginner.fromJson;

  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_BeginnerCopyWith<_$_Beginner> get copyWith =>
      throw _privateConstructorUsedError;
}
