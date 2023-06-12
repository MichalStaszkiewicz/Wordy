import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wordy/data/network/exceptions/exception_helper.dart';
import 'package:wordy/domain/logic/user_service.dart';
import 'package:wordy/domain/models/custom_error.dart';
import 'package:wordy/domain/repositiories/repository.dart';
import 'package:wordy/presentation/bloc/settings/settings_bloc.dart';
import 'package:wordy/utility/socket_manager.dart';

import '../../../../domain/models/active_course.dart';
import '../../../../domain/models/course.dart';
import '../../../../domain/models/user_active_courses_progress.dart';

import '../../../Utility/locator/service_locator.dart';

import '../../../data/dto/active_course_response.dart';
import '../../../data/dto/user_active_courses_progress_response.dart';
import '../../../domain/repositiories/socket_repository.dart';

part 'courses_update_event.dart';
part 'courses_update_state.dart';

class CoursesUpdateBloc extends Bloc<CoursesUpdateEvent, CoursesUpdateState> {
  late double totalProgress = 0;
  final StreamRepository socketRepository;
  final socketManager = locator<SocketManager>();

  late StreamSubscription<UserActiveCoursesProgressResponse> _activeCoursesSub;
  late StreamSubscription<ActiveCourseResponse> _currentCourseSub;
  CoursesUpdateBloc(this.socketRepository) : super(CoursesUpdateInitial()) {
    _activeCoursesSub =
        socketRepository.courseStreamController.stream.listen((data) {
      if (!isClosed) {
        add(LoadCourses(
          courses: data.toDomain(),
        ));
      }
    });

    _currentCourseSub =
        socketRepository.currentCourseStreamController.stream.listen((data) {
      totalProgress = data.totalProgress;
      if (!isClosed) {
        add(LoadCurrentCourse(course: data.toDomain()));
      }
    });

    loadUserCurrentCourse();
    loadAvailableCourses();
    updateSelectedCourse();
    initialCourses();
    initialCurrentCourse();
    loadCourses();
    addNewCourse();
  }

  @override
  Future<void> close() {
    _activeCoursesSub.cancel();
    _currentCourseSub.cancel();

    return super.close();
  }

  void initialCurrentCourse() {
    on<CurrentCourseInitial>((event, emit) async {
      final userId = await locator<Repository>().getToken();

      if (userId.isLeft) {
        emit(CourseUpdateError(
            error: ExceptionHelper.getErrorMessage(userId.left!)));
      }
      socketManager.loadCurrentCourse(userId.right!);
    });
  }

  void initialCourses() {
    on<InitialCourses>((event, emit) async {
      final userId = await locator<Repository>().getToken();

      if (userId.isLeft) {
        emit(CourseUpdateError(
            error: ExceptionHelper.getErrorMessage(userId.left!)));
      }
      socketManager.loggedIn(userId.right!);
    });
  }

  void addNewCourse() {
    on<AddNewCourse>((event, emit) async {
      final userId = await locator<Repository>().getToken();

      if (userId.isLeft) {
        emit(CourseUpdateError(
            error: ExceptionHelper.getErrorMessage(userId.left!)));
      }
      await locator<UserService>()
          .updateUserCurrentCourse(event.selectedCourse)
          .then((value) => socketManager.loggedIn(userId.right!));
    });
  }

  void loadCourses() {
    on<LoadCourses>((event, emit) async {
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
        final UserActiveCoursesProgress coursesData = event.courses;
        coursesData.availableCourses = availableCourses.right!;

        emit(CoursesLoaded(
            courses: coursesData,
            availableCoursesCount: availableCourses.right!));
      }
    });
  }

  void updateSelectedCourse() {
    on<UpdateSelectedCourse>((event, emit) {
      final state = this.state as AvailableCoursesLoaded;
      emit(AvailableCoursesLoaded(
          selectedCourse: event.courseName,
          userInterfaceLanguage: state.userInterfaceLanguage));
    });
  }

  void loadAvailableCourses() {
    on<LoadAvailableCourses>((event, emit) async {
      final userInterfaceLanguage =
          await locator<UserService>().getUserInterfaceLanguage();
      if (userInterfaceLanguage.isLeft) {
        emit(CourseUpdateError(
            error:
                ExceptionHelper.getErrorMessage(userInterfaceLanguage.left!)));
      }
      emit(AvailableCoursesLoaded(
          selectedCourse: '',
          userInterfaceLanguage: userInterfaceLanguage.right!));
    });
  }

  void loadUserCurrentCourse() {
    on<LoadCurrentCourse>((event, emit) {
      emit(CourseTopicsLoaded(course: event.course));
    });
  }
}
