import 'package:flutter/material.dart';
import 'package:wordy/domain/models/active_course.dart';

class CourseProgressTracker {
  ActiveCourse? beforeQuiz;
  ActiveCourse? afterQuiz;
  String quizType = 'Learning';
  CourseProgressTracker();
}
