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
  CoursesLoaded({required this.courses, required this.availableCourses});
  UserActiveCoursesProgress courses;
  List<Course> availableCourses;

  @override
  List<Object> get props => [courses, availableCourses];
}

class AvailableCoursesLoaded extends CoursesUpdateState {
  AvailableCoursesLoaded(
      {required this.selectedCourse, required this.userInterfaceLanguage});

  String selectedCourse;
  String userInterfaceLanguage;
  @override
  List<Object> get props => [selectedCourse, userInterfaceLanguage];
}

class CourseTopicsLoaded extends CoursesUpdateState {
  CourseTopicsLoaded({required this.course});
  ActiveCourse course;
  @override
  List<Object> get props => [];
}
