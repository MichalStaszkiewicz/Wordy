import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wordy/data/network/exceptions/exception_helper.dart';
import 'package:wordy/domain/logic/user_service.dart';
import 'package:wordy/domain/models/custom_error.dart';
import 'package:wordy/domain/models/user_course.dart';
import 'package:wordy/presentation/Bloc/user_progress/user_progress_bloc.dart';
import 'package:wordy/presentation/bloc/topics/topics_bloc.dart';
import 'package:wordy/utility/locator/api_locator.dart';

import '../../../../domain/models/active_course.dart';
import '../../../../domain/models/course.dart';
import '../../../../domain/models/user_active_courses_progress.dart';

part 'courses_update_event.dart';
part 'courses_update_state.dart';

class CoursesUpdateBloc extends Bloc<CoursesUpdateEvent, CoursesUpdateState> {
  CoursesUpdateBloc() : super(CoursesUpdateInitial()) {
    updateUserCourses();
    loadUserCurrentCourse();
    loadAvailableCourses();
    updateSelectedCourse();
  }
  void updateSelectedCourse() {
    on<UpdateSelectedCourse>((event, emit) {
      final state = this.state as AvailableCoursesLoaded;
      emit(AvailableCoursesLoaded(
          courses: state.courses,
          selectedCourse: event.courseName,
          userInterfaceLanguage: state.userInterfaceLanguage));
    });
  }

  void loadAvailableCourses() {
    on<LoadAvailableCourses>((event, emit) async {
      final availableCourses =
          await locator<UserService>().getAvailableCourses();
      final userInterfaceLanguage =
          await locator<UserService>().getUserInterfaceLanguage();
      if (userInterfaceLanguage.isLeft) {
        emit(CourseUpdateError(
            error:
                ExceptionHelper.getErrorMessage(userInterfaceLanguage.left!)));
      }
      if (availableCourses.isLeft) {
        emit(CourseUpdateError(
            error: ExceptionHelper.getErrorMessage(availableCourses.left!)));
      } else {
        emit(AvailableCoursesLoaded(
            courses: availableCourses.right!,
            selectedCourse: '',
            userInterfaceLanguage: userInterfaceLanguage.right!));
      }
    });
  }

  void updateUserCourses() {
    on<LoadCourses>((event, emit) async {
      final courses =
          await locator<UserService>().getUserActiveCoursesProgress();
      final availableCoures =
          await locator<UserService>().getAvailableCourses();
      if (availableCoures.isLeft) {
        emit(CourseUpdateError(
            error: ExceptionHelper.getErrorMessage(availableCoures.left!)));
      }
      if (courses.isLeft) {
        emit(CourseUpdateError(
            error: ExceptionHelper.getErrorMessage(courses.left!)));
      } else {
        emit(CoursesLoaded(
            courses: courses.right!,
            availablCoursesCount: availableCoures.right!.length));
      }
    });
  }

  void loadUserCurrentCourse() {
    on<LoadCurrentCourse>((event, emit) async {
      final course =
          await locator<UserService>().getUserCurrentCourseProgress();
      if (course.isLeft) {
        emit(CourseUpdateError(
            error: ExceptionHelper.getErrorMessage(course.left!)));
      } else {
        emit(CourseTopicsLoaded(course: course.right!));
      }
    });
  }
}
