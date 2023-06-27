import 'dart:async';

import 'package:socket_io_client/socket_io_client.dart';
import 'package:wordy/data/network/response/achievement_list_response.dart';
import 'package:wordy/domain/logic/user_service.dart';
import 'package:wordy/domain/models/user_achievement.dart';
import 'package:wordy/domain/repositiories/repository.dart';

import '../../Utility/locator/service_locator.dart';
import '../models/active_course.dart';
import '../models/user_active_courses_progress.dart';

class StreamRepository {
  final Socket _socket = locator<Socket>();
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
    _socket.on('loadCourses', (data) {
      _courseStreamController.add(UserActiveCoursesProgress.fromJson(data));
    });

    _socket.on('current_course', (data) {
      currentCourseStreamController
          .add(ActiveCourse.fromJson(data['activeCourse']));
    });
    _socket.on('got_new_achievement', (data) {
      List<UserAchievement> list =
          AchievementListResponse.fromJson(data).achievements;

      _notificationController.add(AchievementListResponse.fromJson(data));
    });
    _socket.on('logout_success', (data) {
      _notificationController.add("loggedOut");
    });
    _socket.on('token_expired', (data) async {
 


      await locator<Repository>().saveTokenAccess(data['token']);
    });
    _socket.on('request_refresh_token', (data) async {
      var refreshToken = await locator<UserService>().getTokenRefresh();


      _socket.emit('refresh_token', {"refreshToken": refreshToken.data!});
    });
  }
}
