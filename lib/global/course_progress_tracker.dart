import 'package:wordy/const/enums.dart';
import 'package:wordy/domain/models/active_course.dart';

class CourseProgressTracker {
  ActiveCourse? beforeQuiz;
  ActiveCourse? afterQuiz;
  QuizType quizType = QuizType.learning;
  CourseProgressTracker();
}
