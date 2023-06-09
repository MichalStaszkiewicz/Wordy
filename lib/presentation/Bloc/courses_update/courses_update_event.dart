part of 'courses_update_bloc.dart';

abstract class CoursesUpdateEvent extends Equatable {
  const CoursesUpdateEvent();

  @override
  List<Object> get props => [];
}

class UpdateUserCourseList extends CoursesUpdateEvent {
  UpdateUserCourseList({required this.courses});
  UserActiveCoursesProgress courses;
}

class InitialCourses extends CoursesUpdateEvent {
  InitialCourses();
}

class AddNewCourse extends CoursesUpdateEvent {
  AddNewCourse({required this.selectedCourse});
  String selectedCourse;
}

class ScreenChanged extends CoursesUpdateEvent {
  ScreenChanged();
}

class LoadCourses extends CoursesUpdateEvent {
  LoadCourses({
    required this.courses,
  });
  UserActiveCoursesProgress courses;
}

class LoadCurrentCourse extends CoursesUpdateEvent {
  LoadCurrentCourse({required this.course});
  ActiveCourse course;
}

class CurrentCourseInitial extends CoursesUpdateEvent {
  CurrentCourseInitial();
}

class LoadAvailableCourses extends CoursesUpdateEvent {
  const LoadAvailableCourses();
}

class UpdateSelectedCourse extends CoursesUpdateEvent {
  UpdateSelectedCourse({required this.courseName});
  String courseName;
}