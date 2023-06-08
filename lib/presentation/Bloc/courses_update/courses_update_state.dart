part of 'courses_update_bloc.dart';

abstract class CoursesUpdateState extends Equatable {
  const CoursesUpdateState();

  @override
  List<Object> get props => [];
}

class CoursesUpdateInitial extends CoursesUpdateState {}

class CourseUpdateError extends CoursesUpdateState {
  CourseUpdateError({required this.error});
  CustomError error;
  @override
  List<Object> get props => [];
}

class CoursesLoaded extends CoursesUpdateState {
  CoursesLoaded({required this.courses, required this.availablCoursesCount});
  UserActiveCoursesProgress courses;
  int availablCoursesCount;

  @override
  List<Object> get props => [courses, availablCoursesCount];
}

class AvailableCoursesLoaded extends CoursesUpdateState {
  AvailableCoursesLoaded(
      {required this.courses,
      required this.selectedCourse,
      required this.userInterfaceLanguage});
  List<Course> courses;
  String selectedCourse;
  String userInterfaceLanguage;
  @override
  List<Object> get props => [courses, selectedCourse, userInterfaceLanguage];
}

class CourseTopicsLoaded extends CoursesUpdateState {
  CourseTopicsLoaded({required this.course});
  ActiveCourse course;
  @override
  List<Object> get props => [];
}
