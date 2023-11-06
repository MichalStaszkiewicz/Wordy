import 'package:flutter/material.dart';
import 'package:wordy/Utility/locator/service_locator.dart';
import 'package:wordy/const/enums.dart';
import 'package:wordy/domain/models/active_course.dart';

class CourseProgressTracker extends ChangeNotifier {
  ActiveCourse? beforeQuiz;
  ActiveCourse? afterQuiz;
  QuizType quizType = QuizType.learning;
  bool quizTypeListExpanded = false;
  CourseProgressTracker();

  void setQuizType(QuizType quizType) {
    this.quizType = quizType;
    locator<CourseProgressTracker>().quizType = quizType;
    notifyListeners();
  }

  void setBeforeQuiz(ActiveCourse? beforeQuiz) {
    this.beforeQuiz = beforeQuiz;
    locator<CourseProgressTracker>().beforeQuiz = beforeQuiz;
    notifyListeners();
  }

  void setAfterQuiz(ActiveCourse? afterQuiz) {
    this.afterQuiz = afterQuiz;
    locator<CourseProgressTracker>().afterQuiz = afterQuiz;
    notifyListeners();
  }

  void setQuizTypeListExpanded() {
    quizTypeListExpanded = !quizTypeListExpanded;
    notifyListeners();
  }
}
