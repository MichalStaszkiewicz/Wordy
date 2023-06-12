// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'interface_language.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InterfaceLanguage _$InterfaceLanguageFromJson(Map<String, dynamic> json) {
  return _InterfaceLanguage.fromJson(json);
}

/// @nodoc
mixin _$InterfaceLanguage {
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get circularImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InterfaceLanguageCopyWith<InterfaceLanguage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InterfaceLanguageCopyWith<$Res> {
  factory $InterfaceLanguageCopyWith(
          InterfaceLanguage value, $Res Function(InterfaceLanguage) then) =
      _$InterfaceLanguageCopyWithImpl<$Res, InterfaceLanguage>;
  @useResult
  $Res call({String name, String image, String circularImage});
}

/// @nodoc
class _$InterfaceLanguageCopyWithImpl<$Res, $Val extends InterfaceLanguage>
    implements $InterfaceLanguageCopyWith<$Res> {
  _$InterfaceLanguageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? image = null,
    Object? circularImage = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      circularImage: null == circularImage
          ? _value.circularImage
          : circularImage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InterfaceLanguageCopyWith<$Res>
    implements $InterfaceLanguageCopyWith<$Res> {
  factory _$$_InterfaceLanguageCopyWith(_$_InterfaceLanguage value,
          $Res Function(_$_InterfaceLanguage) then) =
      __$$_InterfaceLanguageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String image, String circularImage});
}

/// @nodoc
class __$$_InterfaceLanguageCopyWithImpl<$Res>
    extends _$InterfaceLanguageCopyWithImpl<$Res, _$_InterfaceLanguage>
    implements _$$_InterfaceLanguageCopyWith<$Res> {
  __$$_InterfaceLanguageCopyWithImpl(
      _$_InterfaceLanguage _value, $Res Function(_$_InterfaceLanguage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? image = null,
    Object? circularImage = null,
  }) {
    return _then(_$_InterfaceLanguage(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      circularImage: null == circularImage
          ? _value.circularImage
          : circularImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InterfaceLanguage implements _InterfaceLanguage {
  _$_InterfaceLanguage(
      {required this.name, required this.image, required this.circularImage});

  factory _$_InterfaceLanguage.fromJson(Map<String, dynamic> json) =>
      _$$_InterfaceLanguageFromJson(json);

  @override
  final String name;
  @override
  final String image;
  @override
  final String circularImage;

  @override
  String toString() {
    return 'InterfaceLanguage(name: $name, image: $image, circularImage: $circularImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InterfaceLanguage &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.circularImage, circularImage) ||
                other.circularImage == circularImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, image, circularImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InterfaceLanguageCopyWith<_$_InterfaceLanguage> get copyWith =>
      __$$_InterfaceLanguageCopyWithImpl<_$_InterfaceLanguage>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InterfaceLanguageToJson(
      this,
    );
  }
}

abstract class _InterfaceLanguage implements InterfaceLanguage {
  factory _InterfaceLanguage(
      {required final String name,
      required final String image,
      required final String circularImage}) = _$_InterfaceLanguage;

  factory _InterfaceLanguage.fromJson(Map<String, dynamic> json) =
      _$_InterfaceLanguage.fromJson;

  @override
  String get name;
  @override
  String get image;
  @override
  String get circularImage;
  @override
  @JsonKey(ignore: true)
  _$$_InterfaceLanguageCopyWith<_$_InterfaceLanguage> get copyWith =>
      throw _privateConstructorUsedError;
}
