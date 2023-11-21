import 'package:flutter/material.dart';
import 'package:wordy/Utility/locator/service_locator.dart';
import 'package:wordy/const/enums.dart';
import 'package:wordy/domain/models/active_course.dart';

class SelectedCourseNotifier extends ChangeNotifier {
  ActiveCourse? beforeQuiz;
  ActiveCourse? afterQuiz;
  QuizType quizType = QuizType.learning;
  bool quizTypeListExpanded = false;
  SelectedCourseNotifier();
  Offset? courseTitle;
  void setTitleRenderBox(RenderBox box) {
    courseTitle = box.localToGlobal(Offset.zero);
    notifyListeners();
  }

  void setQuizType(QuizType quizType) {
    this.quizType = quizType;
    locator<SelectedCourseNotifier>().quizType = quizType;
    notifyListeners();
  }

  void setBeforeQuiz(ActiveCourse? beforeQuiz) {
    this.beforeQuiz = beforeQuiz;
    locator<SelectedCourseNotifier>().beforeQuiz = beforeQuiz;
    notifyListeners();
  }

  void setAfterQuiz(ActiveCourse? afterQuiz) {
    this.afterQuiz = afterQuiz;
    locator<SelectedCourseNotifier>().afterQuiz = afterQuiz;
    notifyListeners();
  }

  void setQuizTypeListExpanded() {
    quizTypeListExpanded = !quizTypeListExpanded;
    notifyListeners();
  }
}
