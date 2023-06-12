// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'profile_data.g.dart';

@JsonSerializable()
class ProfileData {
  int finishedCourses;
  int learnedWords;
  ProfileData({
    required this.finishedCourses,
    required this.learnedWords,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);
}
