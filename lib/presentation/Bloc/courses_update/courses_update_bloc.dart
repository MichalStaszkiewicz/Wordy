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

import '../../../domain/repositiories/stream_repository.dart';

part 'courses_update_event.dart';
part 'courses_update_state.dart';

class CoursesUpdateBloc extends Bloc<CoursesUpdateEvent, CoursesUpdateState> {
  late double totalProgress = 0;
  final StreamRepository socketRepository;
  final socketManager = locator<SocketManager>();

  late StreamSubscription<UserActiveCoursesProgress> _activeCoursesSub;
  late StreamSubscription<ActiveCourse> _currentCourseSub;
  CoursesUpdateBloc(this.socketRepository) : super(CoursesUpdateInitial()) {
    _activeCoursesSub =
        socketRepository.courseStreamController.stream.listen((data) {
      if (!isClosed) {
        add(LoadCourses(
          courses: data,
        ));
      }
    });

    _currentCourseSub =
        socketRepository.currentCourseStreamController.stream.listen((data) {
      totalProgress = data.totalProgress;

      if (!isClosed) {
        add(LoadCurrentCourse(course: data));
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
      final token = await locator<Repository>().getTokenAccess();

      if (token.isError) {
        emit(CourseUpdateError(
            error: ExceptionHelper.getErrorMessage(token.error!)));
      }
      socketManager.loadCurrentCourse(token.data!);
    });
  }

  void initialCourses() {
    on<InitialCourses>((event, emit) async {
      final userId = await locator<Repository>().getTokenAccess();
   
      if (userId.isError) {
        emit(CourseUpdateError(
            error: ExceptionHelper.getErrorMessage(userId.error!)));
      }
      socketManager.loadTopics(userId.data!);
    });
  }

  void addNewCourse() {
    on<AddNewCourse>((event, emit) async {
      final userId = await locator<Repository>().getTokenAccess();

      if (userId.isError) {
        emit(CourseUpdateError(
            error: ExceptionHelper.getErrorMessage(userId.error!)));
      }
      await locator<UserService>()
          .updateUserCurrentCourse(event.selectedCourse)
          .then((value) => socketManager.loadTopics(userId.data!));
    });
  }

  void loadCourses() {
    on<LoadCourses>((event, emit) async {
      final availableCourses =
          await locator<UserService>().getAvailableCourses();
      final userInterfaceLanguage =
          await locator<UserService>().getUserInterfaceLanguage();
      if (userInterfaceLanguage.isError) {
        emit(CourseUpdateError(
            error:
                ExceptionHelper.getErrorMessage(userInterfaceLanguage.error!)));
      }

      if (availableCourses.isError) {
        emit(CourseUpdateError(
            error: ExceptionHelper.getErrorMessage(availableCourses.error!)));
      } else {
        final UserActiveCoursesProgress coursesData = event.courses;

        emit(CoursesLoaded(
            courses: coursesData, availableCourses: availableCourses.data!));
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
      if (userInterfaceLanguage.isError) {
        emit(CourseUpdateError(
            error:
                ExceptionHelper.getErrorMessage(userInterfaceLanguage.error!)));
      }
      emit(AvailableCoursesLoaded(
          selectedCourse: '',
          userInterfaceLanguage: userInterfaceLanguage.data!));
    });
  }

  void loadUserCurrentCourse() {
    on<LoadCurrentCourse>((event, emit) {
      emit(CourseTopicsLoaded(course: event.course));
    });
  }
}
