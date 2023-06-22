import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:wordy/data/network/response/achievement_list_response.dart';
import 'package:wordy/data/network/response/refresh_room_request.dart';
import 'package:wordy/domain/logic/user_service.dart';
import 'package:wordy/domain/models/user_achievement.dart';
import 'package:wordy/domain/repositiories/repository.dart';
import 'package:wordy/global/notification_provider.dart';
import 'package:wordy/utility/either.dart';
import 'package:wordy/utility/socket_manager.dart';

import '../../Utility/locator/service_locator.dart';
import '../../utility/toast_manager.dart';
import '../models/achievement.dart';
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
      print("LOAD COURSES DATA RECIEVED FROM SERVER");

      _courseStreamController.add(UserActiveCoursesProgress.fromJson(data));
    });
    _socket.on('current_course', (data) {
      currentCourseStreamController
          .add(ActiveCourse.fromJson(data['activeCourse']));
    });
    _socket.on('got_new_achievement', (data) {
      print("GOT NEW ACHIEVEMENTS!!!!!!!!!!!!");
      List<UserAchievement> list =
          AchievementListResponse.fromJson(data).achievements;

      _notificationController.add(AchievementListResponse.fromJson(data));
    });
    _socket.on('logout_success', (data) {
      _notificationController.add("loggedOut");
    });
    _socket.on('token_expired', (data) async {
      print('token expired got new one !');
      print(data);

      await locator<Repository>().saveTokenAccess(data['token']);
    });
    _socket.on('request_refresh_token', (data) async {
      var refreshToken = await locator<UserService>().getTokenRefresh();
      print("asking for refresh token");

      print('sending refresh token...');
      _socket.emit('refresh_token', {"refreshToken": refreshToken.data!});
    });
  }
}
