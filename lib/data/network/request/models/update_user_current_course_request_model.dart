// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../update_user_current_course_request.dart';

class UpdateUserCurrentCourseModel {
  String userId;
  String courseName;
  UpdateUserCurrentCourseModel({
    required this.userId,
    required this.courseName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'courseName': courseName,
    };
  }
}
