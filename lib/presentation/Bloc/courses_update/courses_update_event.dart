part of 'courses_update_bloc.dart';

abstract class CoursesUpdateEvent extends Equatable {
  const CoursesUpdateEvent();

  @override
  List<Object> get props => [];
}

class LoadCourses extends CoursesUpdateEvent {
  LoadCourses();
}

class LoadCurrentCourse extends CoursesUpdateEvent {
  LoadCurrentCourse();
}

class LoadAvailableCourses extends CoursesUpdateEvent {
  LoadAvailableCourses();
}

class UpdateSelectedCourse extends CoursesUpdateEvent {
  UpdateSelectedCourse({required this.courseName});
  String courseName;
}
