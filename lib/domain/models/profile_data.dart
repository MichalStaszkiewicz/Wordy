import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wordy/domain/models/user_achievement.dart';

import 'active_course.dart';

part 'profile_data.freezed.dart';
part 'profile_data.g.dart';

@freezed
class ProfileData with _$ProfileData {
  factory ProfileData({
    required int finishedCourses,
    required int knownWords,
    required List<ActiveCourse> vocabularyProgress,
    required List<UserAchievement> achievements,
    required int hotStreak,
    required String fullName,
  }) = _ProfileData;

  factory ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);
}
