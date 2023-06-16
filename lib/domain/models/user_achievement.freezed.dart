// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_achievement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserAchievement _$UserAchievementFromJson(Map<String, dynamic> json) {
  return _UserAchievement.fromJson(json);
}

/// @nodoc
mixin _$UserAchievement {
  int get progress => throw _privateConstructorUsedError;
  bool get achieved => throw _privateConstructorUsedError;
  Achievement get achievement => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserAchievementCopyWith<UserAchievement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAchievementCopyWith<$Res> {
  factory $UserAchievementCopyWith(
          UserAchievement value, $Res Function(UserAchievement) then) =
      _$UserAchievementCopyWithImpl<$Res, UserAchievement>;
  @useResult
  $Res call({int progress, bool achieved, Achievement achievement});

  $AchievementCopyWith<$Res> get achievement;
}

/// @nodoc
class _$UserAchievementCopyWithImpl<$Res, $Val extends UserAchievement>
    implements $UserAchievementCopyWith<$Res> {
  _$UserAchievementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progress = null,
    Object? achieved = null,
    Object? achievement = null,
  }) {
    return _then(_value.copyWith(
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
      achieved: null == achieved
          ? _value.achieved
          : achieved // ignore: cast_nullable_to_non_nullable
              as bool,
      achievement: null == achievement
          ? _value.achievement
          : achievement // ignore: cast_nullable_to_non_nullable
              as Achievement,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AchievementCopyWith<$Res> get achievement {
    return $AchievementCopyWith<$Res>(_value.achievement, (value) {
      return _then(_value.copyWith(achievement: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserAchievementCopyWith<$Res>
    implements $UserAchievementCopyWith<$Res> {
  factory _$$_UserAchievementCopyWith(
          _$_UserAchievement value, $Res Function(_$_UserAchievement) then) =
      __$$_UserAchievementCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int progress, bool achieved, Achievement achievement});

  @override
  $AchievementCopyWith<$Res> get achievement;
}

/// @nodoc
class __$$_UserAchievementCopyWithImpl<$Res>
    extends _$UserAchievementCopyWithImpl<$Res, _$_UserAchievement>
    implements _$$_UserAchievementCopyWith<$Res> {
  __$$_UserAchievementCopyWithImpl(
      _$_UserAchievement _value, $Res Function(_$_UserAchievement) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progress = null,
    Object? achieved = null,
    Object? achievement = null,
  }) {
    return _then(_$_UserAchievement(
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
      achieved: null == achieved
          ? _value.achieved
          : achieved // ignore: cast_nullable_to_non_nullable
              as bool,
      achievement: null == achievement
          ? _value.achievement
          : achievement // ignore: cast_nullable_to_non_nullable
              as Achievement,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserAchievement implements _UserAchievement {
  _$_UserAchievement(
      {required this.progress,
      required this.achieved,
      required this.achievement});

  factory _$_UserAchievement.fromJson(Map<String, dynamic> json) =>
      _$$_UserAchievementFromJson(json);

  @override
  final int progress;
  @override
  final bool achieved;
  @override
  final Achievement achievement;

  @override
  String toString() {
    return 'UserAchievement(progress: $progress, achieved: $achieved, achievement: $achievement)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserAchievement &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.achieved, achieved) ||
                other.achieved == achieved) &&
            (identical(other.achievement, achievement) ||
                other.achievement == achievement));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, progress, achieved, achievement);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserAchievementCopyWith<_$_UserAchievement> get copyWith =>
      __$$_UserAchievementCopyWithImpl<_$_UserAchievement>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserAchievementToJson(
      this,
    );
  }
}

abstract class _UserAchievement implements UserAchievement {
  factory _UserAchievement(
      {required final int progress,
      required final bool achieved,
      required final Achievement achievement}) = _$_UserAchievement;

  factory _UserAchievement.fromJson(Map<String, dynamic> json) =
      _$_UserAchievement.fromJson;

  @override
  int get progress;
  @override
  bool get achieved;
  @override
  Achievement get achievement;
  @override
  @JsonKey(ignore: true)
  _$$_UserAchievementCopyWith<_$_UserAchievement> get copyWith =>
      throw _privateConstructorUsedError;
}
