// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word_collection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WordCollection _$WordCollectionFromJson(Map<String, dynamic> json) {
  return _WordCollection.fromJson(json);
}

/// @nodoc
mixin _$WordCollection {
  String get topic => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WordCollectionCopyWith<WordCollection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordCollectionCopyWith<$Res> {
  factory $WordCollectionCopyWith(
          WordCollection value, $Res Function(WordCollection) then) =
      _$WordCollectionCopyWithImpl<$Res, WordCollection>;
  @useResult
  $Res call({String topic, String image});
}

/// @nodoc
class _$WordCollectionCopyWithImpl<$Res, $Val extends WordCollection>
    implements $WordCollectionCopyWith<$Res> {
  _$WordCollectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topic = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WordCollectionCopyWith<$Res>
    implements $WordCollectionCopyWith<$Res> {
  factory _$$_WordCollectionCopyWith(
          _$_WordCollection value, $Res Function(_$_WordCollection) then) =
      __$$_WordCollectionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String topic, String image});
}

/// @nodoc
class __$$_WordCollectionCopyWithImpl<$Res>
    extends _$WordCollectionCopyWithImpl<$Res, _$_WordCollection>
    implements _$$_WordCollectionCopyWith<$Res> {
  __$$_WordCollectionCopyWithImpl(
      _$_WordCollection _value, $Res Function(_$_WordCollection) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topic = null,
    Object? image = null,
  }) {
    return _then(_$_WordCollection(
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WordCollection implements _WordCollection {
  _$_WordCollection({required this.topic, required this.image});

  factory _$_WordCollection.fromJson(Map<String, dynamic> json) =>
      _$$_WordCollectionFromJson(json);

  @override
  final String topic;
  @override
  final String image;

  @override
  String toString() {
    return 'WordCollection(topic: $topic, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WordCollection &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, topic, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WordCollectionCopyWith<_$_WordCollection> get copyWith =>
      __$$_WordCollectionCopyWithImpl<_$_WordCollection>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WordCollectionToJson(
      this,
    );
  }
}

abstract class _WordCollection implements WordCollection {
  factory _WordCollection(
      {required final String topic,
      required final String image}) = _$_WordCollection;

  factory _WordCollection.fromJson(Map<String, dynamic> json) =
      _$_WordCollection.fromJson;

  @override
  String get topic;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$_WordCollectionCopyWith<_$_WordCollection> get copyWith =>
      throw _privateConstructorUsedError;
}
