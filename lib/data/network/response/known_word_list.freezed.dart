// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'known_word_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KnownWordList _$KnownWordListFromJson(Map<String, dynamic> json) {
  return _KnownWordList.fromJson(json);
}

/// @nodoc
mixin _$KnownWordList {
  List<Word> get knownWords => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KnownWordListCopyWith<KnownWordList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KnownWordListCopyWith<$Res> {
  factory $KnownWordListCopyWith(
          KnownWordList value, $Res Function(KnownWordList) then) =
      _$KnownWordListCopyWithImpl<$Res, KnownWordList>;
  @useResult
  $Res call({List<Word> knownWords});
}

/// @nodoc
class _$KnownWordListCopyWithImpl<$Res, $Val extends KnownWordList>
    implements $KnownWordListCopyWith<$Res> {
  _$KnownWordListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? knownWords = null,
  }) {
    return _then(_value.copyWith(
      knownWords: null == knownWords
          ? _value.knownWords
          : knownWords // ignore: cast_nullable_to_non_nullable
              as List<Word>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_KnownWordListCopyWith<$Res>
    implements $KnownWordListCopyWith<$Res> {
  factory _$$_KnownWordListCopyWith(
          _$_KnownWordList value, $Res Function(_$_KnownWordList) then) =
      __$$_KnownWordListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Word> knownWords});
}

/// @nodoc
class __$$_KnownWordListCopyWithImpl<$Res>
    extends _$KnownWordListCopyWithImpl<$Res, _$_KnownWordList>
    implements _$$_KnownWordListCopyWith<$Res> {
  __$$_KnownWordListCopyWithImpl(
      _$_KnownWordList _value, $Res Function(_$_KnownWordList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? knownWords = null,
  }) {
    return _then(_$_KnownWordList(
      knownWords: null == knownWords
          ? _value._knownWords
          : knownWords // ignore: cast_nullable_to_non_nullable
              as List<Word>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_KnownWordList implements _KnownWordList {
  const _$_KnownWordList({required final List<Word> knownWords})
      : _knownWords = knownWords;

  factory _$_KnownWordList.fromJson(Map<String, dynamic> json) =>
      _$$_KnownWordListFromJson(json);

  final List<Word> _knownWords;
  @override
  List<Word> get knownWords {
    if (_knownWords is EqualUnmodifiableListView) return _knownWords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_knownWords);
  }

  @override
  String toString() {
    return 'KnownWordList(knownWords: $knownWords)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_KnownWordList &&
            const DeepCollectionEquality()
                .equals(other._knownWords, _knownWords));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_knownWords));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_KnownWordListCopyWith<_$_KnownWordList> get copyWith =>
      __$$_KnownWordListCopyWithImpl<_$_KnownWordList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KnownWordListToJson(
      this,
    );
  }
}

abstract class _KnownWordList implements KnownWordList {
  const factory _KnownWordList({required final List<Word> knownWords}) =
      _$_KnownWordList;

  factory _KnownWordList.fromJson(Map<String, dynamic> json) =
      _$_KnownWordList.fromJson;

  @override
  List<Word> get knownWords;
  @override
  @JsonKey(ignore: true)
  _$$_KnownWordListCopyWith<_$_KnownWordList> get copyWith =>
      throw _privateConstructorUsedError;
}
