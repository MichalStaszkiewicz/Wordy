// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'difficulty.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Difficulty _$DifficultyFromJson(Map<String, dynamic> json) {
  return _Difficulty.fromJson(json);
}

/// @nodoc
mixin _$Difficulty {
  Beginner get beginner => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DifficultyCopyWith<Difficulty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DifficultyCopyWith<$Res> {
  factory $DifficultyCopyWith(
          Difficulty value, $Res Function(Difficulty) then) =
      _$DifficultyCopyWithImpl<$Res, Difficulty>;
  @useResult
  $Res call({Beginner beginner});

  $BeginnerCopyWith<$Res> get beginner;
}

/// @nodoc
class _$DifficultyCopyWithImpl<$Res, $Val extends Difficulty>
    implements $DifficultyCopyWith<$Res> {
  _$DifficultyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? beginner = null,
  }) {
    return _then(_value.copyWith(
      beginner: null == beginner
          ? _value.beginner
          : beginner // ignore: cast_nullable_to_non_nullable
              as Beginner,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BeginnerCopyWith<$Res> get beginner {
    return $BeginnerCopyWith<$Res>(_value.beginner, (value) {
      return _then(_value.copyWith(beginner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DifficultyCopyWith<$Res>
    implements $DifficultyCopyWith<$Res> {
  factory _$$_DifficultyCopyWith(
          _$_Difficulty value, $Res Function(_$_Difficulty) then) =
      __$$_DifficultyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Beginner beginner});

  @override
  $BeginnerCopyWith<$Res> get beginner;
}

/// @nodoc
class __$$_DifficultyCopyWithImpl<$Res>
    extends _$DifficultyCopyWithImpl<$Res, _$_Difficulty>
    implements _$$_DifficultyCopyWith<$Res> {
  __$$_DifficultyCopyWithImpl(
      _$_Difficulty _value, $Res Function(_$_Difficulty) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? beginner = null,
  }) {
    return _then(_$_Difficulty(
      beginner: null == beginner
          ? _value.beginner
          : beginner // ignore: cast_nullable_to_non_nullable
              as Beginner,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Difficulty implements _Difficulty {
  _$_Difficulty({required this.beginner});

  factory _$_Difficulty.fromJson(Map<String, dynamic> json) =>
      _$$_DifficultyFromJson(json);

  @override
  final Beginner beginner;

  @override
  String toString() {
    return 'Difficulty(beginner: $beginner)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Difficulty &&
            (identical(other.beginner, beginner) ||
                other.beginner == beginner));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, beginner);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DifficultyCopyWith<_$_Difficulty> get copyWith =>
      __$$_DifficultyCopyWithImpl<_$_Difficulty>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DifficultyToJson(
      this,
    );
  }
}

abstract class _Difficulty implements Difficulty {
  factory _Difficulty({required final Beginner beginner}) = _$_Difficulty;

  factory _Difficulty.fromJson(Map<String, dynamic> json) =
      _$_Difficulty.fromJson;

  @override
  Beginner get beginner;
  @override
  @JsonKey(ignore: true)
  _$$_DifficultyCopyWith<_$_Difficulty> get copyWith =>
      throw _privateConstructorUsedError;
}
