// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flash_card_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FlashCardListResponse _$FlashCardListResponseFromJson(
    Map<String, dynamic> json) {
  return _FlashCardListResponse.fromJson(json);
}

/// @nodoc
mixin _$FlashCardListResponse {
  List<Word> get wordList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlashCardListResponseCopyWith<FlashCardListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlashCardListResponseCopyWith<$Res> {
  factory $FlashCardListResponseCopyWith(FlashCardListResponse value,
          $Res Function(FlashCardListResponse) then) =
      _$FlashCardListResponseCopyWithImpl<$Res, FlashCardListResponse>;
  @useResult
  $Res call({List<Word> wordList});
}

/// @nodoc
class _$FlashCardListResponseCopyWithImpl<$Res,
        $Val extends FlashCardListResponse>
    implements $FlashCardListResponseCopyWith<$Res> {
  _$FlashCardListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wordList = null,
  }) {
    return _then(_value.copyWith(
      wordList: null == wordList
          ? _value.wordList
          : wordList // ignore: cast_nullable_to_non_nullable
              as List<Word>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FlashCardListResponseCopyWith<$Res>
    implements $FlashCardListResponseCopyWith<$Res> {
  factory _$$_FlashCardListResponseCopyWith(_$_FlashCardListResponse value,
          $Res Function(_$_FlashCardListResponse) then) =
      __$$_FlashCardListResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Word> wordList});
}

/// @nodoc
class __$$_FlashCardListResponseCopyWithImpl<$Res>
    extends _$FlashCardListResponseCopyWithImpl<$Res, _$_FlashCardListResponse>
    implements _$$_FlashCardListResponseCopyWith<$Res> {
  __$$_FlashCardListResponseCopyWithImpl(_$_FlashCardListResponse _value,
      $Res Function(_$_FlashCardListResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wordList = null,
  }) {
    return _then(_$_FlashCardListResponse(
      wordList: null == wordList
          ? _value._wordList
          : wordList // ignore: cast_nullable_to_non_nullable
              as List<Word>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FlashCardListResponse implements _FlashCardListResponse {
  const _$_FlashCardListResponse({required final List<Word> wordList})
      : _wordList = wordList;

  factory _$_FlashCardListResponse.fromJson(Map<String, dynamic> json) =>
      _$$_FlashCardListResponseFromJson(json);

  final List<Word> _wordList;
  @override
  List<Word> get wordList {
    if (_wordList is EqualUnmodifiableListView) return _wordList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wordList);
  }

  @override
  String toString() {
    return 'FlashCardListResponse(wordList: $wordList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FlashCardListResponse &&
            const DeepCollectionEquality().equals(other._wordList, _wordList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_wordList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FlashCardListResponseCopyWith<_$_FlashCardListResponse> get copyWith =>
      __$$_FlashCardListResponseCopyWithImpl<_$_FlashCardListResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FlashCardListResponseToJson(
      this,
    );
  }
}

abstract class _FlashCardListResponse implements FlashCardListResponse {
  const factory _FlashCardListResponse({required final List<Word> wordList}) =
      _$_FlashCardListResponse;

  factory _FlashCardListResponse.fromJson(Map<String, dynamic> json) =
      _$_FlashCardListResponse.fromJson;

  @override
  List<Word> get wordList;
  @override
  @JsonKey(ignore: true)
  _$$_FlashCardListResponseCopyWith<_$_FlashCardListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
