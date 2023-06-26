// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mode.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Mode _$ModeFromJson(Map<String, dynamic> json) {
  return _Mode.fromJson(json);
}

/// @nodoc
mixin _$Mode {
  Vocabulary get vocabulary => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ModeCopyWith<Mode> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModeCopyWith<$Res> {
  factory $ModeCopyWith(Mode value, $Res Function(Mode) then) =
      _$ModeCopyWithImpl<$Res, Mode>;
  @useResult
  $Res call({Vocabulary vocabulary});

  $VocabularyCopyWith<$Res> get vocabulary;
}

/// @nodoc
class _$ModeCopyWithImpl<$Res, $Val extends Mode>
    implements $ModeCopyWith<$Res> {
  _$ModeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vocabulary = null,
  }) {
    return _then(_value.copyWith(
      vocabulary: null == vocabulary
          ? _value.vocabulary
          : vocabulary // ignore: cast_nullable_to_non_nullable
              as Vocabulary,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VocabularyCopyWith<$Res> get vocabulary {
    return $VocabularyCopyWith<$Res>(_value.vocabulary, (value) {
      return _then(_value.copyWith(vocabulary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ModeCopyWith<$Res> implements $ModeCopyWith<$Res> {
  factory _$$_ModeCopyWith(_$_Mode value, $Res Function(_$_Mode) then) =
      __$$_ModeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Vocabulary vocabulary});

  @override
  $VocabularyCopyWith<$Res> get vocabulary;
}

/// @nodoc
class __$$_ModeCopyWithImpl<$Res> extends _$ModeCopyWithImpl<$Res, _$_Mode>
    implements _$$_ModeCopyWith<$Res> {
  __$$_ModeCopyWithImpl(_$_Mode _value, $Res Function(_$_Mode) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vocabulary = null,
  }) {
    return _then(_$_Mode(
      vocabulary: null == vocabulary
          ? _value.vocabulary
          : vocabulary // ignore: cast_nullable_to_non_nullable
              as Vocabulary,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Mode implements _Mode {
  _$_Mode({required this.vocabulary});

  factory _$_Mode.fromJson(Map<String, dynamic> json) => _$$_ModeFromJson(json);

  @override
  final Vocabulary vocabulary;

  @override
  String toString() {
    return 'Mode(vocabulary: $vocabulary)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Mode &&
            (identical(other.vocabulary, vocabulary) ||
                other.vocabulary == vocabulary));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, vocabulary);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ModeCopyWith<_$_Mode> get copyWith =>
      __$$_ModeCopyWithImpl<_$_Mode>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ModeToJson(
      this,
    );
  }
}

abstract class _Mode implements Mode {
  factory _Mode({required final Vocabulary vocabulary}) = _$_Mode;

  factory _Mode.fromJson(Map<String, dynamic> json) = _$_Mode.fromJson;

  @override
  Vocabulary get vocabulary;
  @override
  @JsonKey(ignore: true)
  _$$_ModeCopyWith<_$_Mode> get copyWith => throw _privateConstructorUsedError;
}
