import 'dart:async';

import 'package:socket_io_client/socket_io_client.dart';
import 'package:wordy/data/network/response/achievement_list_response.dart';
import 'package:wordy/domain/logic/user_service.dart';
import 'package:wordy/domain/models/user_achievement.dart';
import 'package:wordy/domain/repositiories/repository.dart';

import '../../Utility/locator/service_locator.dart';
import '../../const/socket_events.dart';
import '../models/active_course.dart';
import '../models/user_active_courses_progress.dart';

class StreamRepository {
  final Socket _socket;

  StreamRepository(this._socket);
  final StreamController<UserActiveCoursesProgress> _courseStreamController =
      StreamController<UserActiveCoursesProgress>.broadcast();
  final StreamController<ActiveCourse> _currentCourseStreamController =
      StreamController<ActiveCourse>.broadcast();
  final StreamController<dynamic> _notificationController =
      StreamController.broadcast();
  StreamController<UserActiveCoursesProgress> get courseStreamController =>
      _courseStreamController;

  StreamController<ActiveCourse> get currentCourseStreamController =>
    _currentCourseStreamController;
  StreamController<dynamic> get notificationController =>
      _notificationController;

  void initialize() {
    _socket.on(SocketEvents.LOAD_COURSES, (data) {

      _courseStreamController.add(UserActiveCoursesProgress.fromJson(data));
    });

    _socket.on(SocketEvents.CURRENT_COURSE, (data) {
      currentCourseStreamController
          .add(ActiveCourse.fromJson(data['activeCourse']));
    });
    _socket.on(SocketEvents.GOT_NEW_ACHIEVEMENT, (data) {
      _notificationController.add(AchievementListResponse.fromJson(data));
    });
    _socket.on(SocketEvents.LOGOUT_SUCCESS, (data) {
      _notificationController.add("loggedOut");
    });
    _socket.on(SocketEvents.TOKEN_EXPIRED, (data) async {
      await locator<Repository>().saveTokenAccess(data['token']);
    });
    _socket.on(SocketEvents.REQUEST_REFRESH_TOKEN, (data) async {
      var refreshToken = await locator<UserService>().getTokenRefresh();

      _socket.emit(
          SocketEvents.REFRESH_TOKEN, {"refreshToken": refreshToken.data!});
    });
  }
}
