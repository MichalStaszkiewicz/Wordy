
import 'package:flutter/material.dart';
import 'package:wordy/const/enums.dart';
import 'package:wordy/domain/models/active_course.dart';

class CourseProgressTracker  extends ChangeNotifier{
  ActiveCourse? beforeQuiz;
  ActiveCourse? afterQuiz;
  QuizType quizType = QuizType.learning;
  CourseProgressTracker();

  void setQuizType(QuizType quizType) {
    this.quizType = quizType;
    notifyListeners();
  }
}
