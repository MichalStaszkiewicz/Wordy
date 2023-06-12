// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'learned_words_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LearnedWordsList _$LearnedWordsListFromJson(Map<String, dynamic> json) {
  return _LearnedWordsList.fromJson(json);
}

/// @nodoc
mixin _$LearnedWordsList {
  List<Word> get learnedWords => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LearnedWordsListCopyWith<LearnedWordsList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LearnedWordsListCopyWith<$Res> {
  factory $LearnedWordsListCopyWith(
          LearnedWordsList value, $Res Function(LearnedWordsList) then) =
      _$LearnedWordsListCopyWithImpl<$Res, LearnedWordsList>;
  @useResult
  $Res call({List<Word> learnedWords});
}

/// @nodoc
class _$LearnedWordsListCopyWithImpl<$Res, $Val extends LearnedWordsList>
    implements $LearnedWordsListCopyWith<$Res> {
  _$LearnedWordsListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? learnedWords = null,
  }) {
    return _then(_value.copyWith(
      learnedWords: null == learnedWords
          ? _value.learnedWords
          : learnedWords // ignore: cast_nullable_to_non_nullable
              as List<Word>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LearnedWordsListCopyWith<$Res>
    implements $LearnedWordsListCopyWith<$Res> {
  factory _$$_LearnedWordsListCopyWith(
          _$_LearnedWordsList value, $Res Function(_$_LearnedWordsList) then) =
      __$$_LearnedWordsListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Word> learnedWords});
}

/// @nodoc
class __$$_LearnedWordsListCopyWithImpl<$Res>
    extends _$LearnedWordsListCopyWithImpl<$Res, _$_LearnedWordsList>
    implements _$$_LearnedWordsListCopyWith<$Res> {
  __$$_LearnedWordsListCopyWithImpl(
      _$_LearnedWordsList _value, $Res Function(_$_LearnedWordsList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? learnedWords = null,
  }) {
    return _then(_$_LearnedWordsList(
      learnedWords: null == learnedWords
          ? _value._learnedWords
          : learnedWords // ignore: cast_nullable_to_non_nullable
              as List<Word>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LearnedWordsList implements _LearnedWordsList {
  const _$_LearnedWordsList({required final List<Word> learnedWords})
      : _learnedWords = learnedWords;

  factory _$_LearnedWordsList.fromJson(Map<String, dynamic> json) =>
      _$$_LearnedWordsListFromJson(json);

  final List<Word> _learnedWords;
  @override
  List<Word> get learnedWords {
    if (_learnedWords is EqualUnmodifiableListView) return _learnedWords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_learnedWords);
  }

  @override
  String toString() {
    return 'LearnedWordsList(learnedWords: $learnedWords)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LearnedWordsList &&
            const DeepCollectionEquality()
                .equals(other._learnedWords, _learnedWords));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_learnedWords));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LearnedWordsListCopyWith<_$_LearnedWordsList> get copyWith =>
      __$$_LearnedWordsListCopyWithImpl<_$_LearnedWordsList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LearnedWordsListToJson(
      this,
    );
  }
}

abstract class _LearnedWordsList implements LearnedWordsList {
  const factory _LearnedWordsList({required final List<Word> learnedWords}) =
      _$_LearnedWordsList;

  factory _LearnedWordsList.fromJson(Map<String, dynamic> json) =
      _$_LearnedWordsList.fromJson;

  @override
  List<Word> get learnedWords;
  @override
  @JsonKey(ignore: true)
  _$$_LearnedWordsListCopyWith<_$_LearnedWordsList> get copyWith =>
      throw _privateConstructorUsedError;
}
