import 'package:flutter/material.dart';
import 'package:wordy/const/enums.dart';
import 'package:wordy/domain/models/active_course.dart';

class CourseProgressTracker extends ChangeNotifier {
  ActiveCourse? beforeQuiz;
  ActiveCourse? afterQuiz;
  QuizType quizType = QuizType.learning;
  CourseProgressTracker();

  void setQuizType(QuizType quizType) {
    this.quizType = quizType;
    notifyListeners();
  }

  void setBeforeQuiz(ActiveCourse? beforeQuiz) {
    this.beforeQuiz = beforeQuiz;
    notifyListeners();
  }

  void setAfterQuiz(ActiveCourse? afterQuiz) {
    this.afterQuiz = afterQuiz;
    notifyListeners();
  }
}
