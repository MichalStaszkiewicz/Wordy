// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'achievement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Achievement _$AchievementFromJson(Map<String, dynamic> json) {
  return _Achievement.fromJson(json);
}

/// @nodoc
mixin _$Achievement {
  int? get id => throw _privateConstructorUsedError;
  int? get goal => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get progress => throw _privateConstructorUsedError;
  bool? get achieved => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AchievementCopyWith<Achievement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AchievementCopyWith<$Res> {
  factory $AchievementCopyWith(
          Achievement value, $Res Function(Achievement) then) =
      _$AchievementCopyWithImpl<$Res, Achievement>;
  @useResult
  $Res call(
      {int? id,
      int? goal,
      String? type,
      String? description,
      String? name,
      int? progress,
      bool? achieved});
}

/// @nodoc
class _$AchievementCopyWithImpl<$Res, $Val extends Achievement>
    implements $AchievementCopyWith<$Res> {
  _$AchievementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? goal = freezed,
    Object? type = freezed,
    Object? description = freezed,
    Object? name = freezed,
    Object? progress = freezed,
    Object? achieved = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      goal: freezed == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int?,
      achieved: freezed == achieved
          ? _value.achieved
          : achieved // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AchievementCopyWith<$Res>
    implements $AchievementCopyWith<$Res> {
  factory _$$_AchievementCopyWith(
          _$_Achievement value, $Res Function(_$_Achievement) then) =
      __$$_AchievementCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? goal,
      String? type,
      String? description,
      String? name,
      int? progress,
      bool? achieved});
}

/// @nodoc
class __$$_AchievementCopyWithImpl<$Res>
    extends _$AchievementCopyWithImpl<$Res, _$_Achievement>
    implements _$$_AchievementCopyWith<$Res> {
  __$$_AchievementCopyWithImpl(
      _$_Achievement _value, $Res Function(_$_Achievement) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? goal = freezed,
    Object? type = freezed,
    Object? description = freezed,
    Object? name = freezed,
    Object? progress = freezed,
    Object? achieved = freezed,
  }) {
    return _then(_$_Achievement(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      goal: freezed == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int?,
      achieved: freezed == achieved
          ? _value.achieved
          : achieved // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Achievement implements _Achievement {
  const _$_Achievement(
      {this.id,
      this.goal,
      this.type,
      this.description,
      this.name,
      this.progress,
      this.achieved});

  factory _$_Achievement.fromJson(Map<String, dynamic> json) =>
      _$$_AchievementFromJson(json);

  @override
  final int? id;
  @override
  final int? goal;
  @override
  final String? type;
  @override
  final String? description;
  @override
  final String? name;
  @override
  final int? progress;
  @override
  final bool? achieved;

  @override
  String toString() {
    return 'Achievement(id: $id, goal: $goal, type: $type, description: $description, name: $name, progress: $progress, achieved: $achieved)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Achievement &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.goal, goal) || other.goal == goal) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.achieved, achieved) ||
                other.achieved == achieved));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, goal, type, description, name, progress, achieved);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AchievementCopyWith<_$_Achievement> get copyWith =>
      __$$_AchievementCopyWithImpl<_$_Achievement>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AchievementToJson(
      this,
    );
  }
}

abstract class _Achievement implements Achievement {
  const factory _Achievement(
      {final int? id,
      final int? goal,
      final String? type,
      final String? description,
      final String? name,
      final int? progress,
      final bool? achieved}) = _$_Achievement;

  factory _Achievement.fromJson(Map<String, dynamic> json) =
      _$_Achievement.fromJson;

  @override
  int? get id;
  @override
  int? get goal;
  @override
  String? get type;
  @override
  String? get description;
  @override
  String? get name;
  @override
  int? get progress;
  @override
  bool? get achieved;
  @override
  @JsonKey(ignore: true)
  _$$_AchievementCopyWith<_$_Achievement> get copyWith =>
      throw _privateConstructorUsedError;
}
