// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserSettings _$UserSettingsFromJson(Map<String, dynamic> json) {
  return _UserSettings.fromJson(json);
}

/// @nodoc
mixin _$UserSettings {
  InterfaceLanguage get interfaceLanguage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserSettingsCopyWith<UserSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSettingsCopyWith<$Res> {
  factory $UserSettingsCopyWith(
          UserSettings value, $Res Function(UserSettings) then) =
      _$UserSettingsCopyWithImpl<$Res, UserSettings>;
  @useResult
  $Res call({InterfaceLanguage interfaceLanguage});

  $InterfaceLanguageCopyWith<$Res> get interfaceLanguage;
}

/// @nodoc
class _$UserSettingsCopyWithImpl<$Res, $Val extends UserSettings>
    implements $UserSettingsCopyWith<$Res> {
  _$UserSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? interfaceLanguage = null,
  }) {
    return _then(_value.copyWith(
      interfaceLanguage: null == interfaceLanguage
          ? _value.interfaceLanguage
          : interfaceLanguage // ignore: cast_nullable_to_non_nullable
              as InterfaceLanguage,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $InterfaceLanguageCopyWith<$Res> get interfaceLanguage {
    return $InterfaceLanguageCopyWith<$Res>(_value.interfaceLanguage, (value) {
      return _then(_value.copyWith(interfaceLanguage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserSettingsCopyWith<$Res>
    implements $UserSettingsCopyWith<$Res> {
  factory _$$_UserSettingsCopyWith(
          _$_UserSettings value, $Res Function(_$_UserSettings) then) =
      __$$_UserSettingsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({InterfaceLanguage interfaceLanguage});

  @override
  $InterfaceLanguageCopyWith<$Res> get interfaceLanguage;
}

/// @nodoc
class __$$_UserSettingsCopyWithImpl<$Res>
    extends _$UserSettingsCopyWithImpl<$Res, _$_UserSettings>
    implements _$$_UserSettingsCopyWith<$Res> {
  __$$_UserSettingsCopyWithImpl(
      _$_UserSettings _value, $Res Function(_$_UserSettings) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? interfaceLanguage = null,
  }) {
    return _then(_$_UserSettings(
      interfaceLanguage: null == interfaceLanguage
          ? _value.interfaceLanguage
          : interfaceLanguage // ignore: cast_nullable_to_non_nullable
              as InterfaceLanguage,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserSettings implements _UserSettings {
  const _$_UserSettings({required this.interfaceLanguage});

  factory _$_UserSettings.fromJson(Map<String, dynamic> json) =>
      _$$_UserSettingsFromJson(json);

  @override
  final InterfaceLanguage interfaceLanguage;

  @override
  String toString() {
    return 'UserSettings(interfaceLanguage: $interfaceLanguage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserSettings &&
            (identical(other.interfaceLanguage, interfaceLanguage) ||
                other.interfaceLanguage == interfaceLanguage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, interfaceLanguage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserSettingsCopyWith<_$_UserSettings> get copyWith =>
      __$$_UserSettingsCopyWithImpl<_$_UserSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserSettingsToJson(
      this,
    );
  }
}

abstract class _UserSettings implements UserSettings {
  const factory _UserSettings(
      {required final InterfaceLanguage interfaceLanguage}) = _$_UserSettings;

  factory _UserSettings.fromJson(Map<String, dynamic> json) =
      _$_UserSettings.fromJson;

  @override
  InterfaceLanguage get interfaceLanguage;
  @override
  @JsonKey(ignore: true)
  _$$_UserSettingsCopyWith<_$_UserSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
