import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:wordy/data/network/response/achievement_list_response.dart';
import 'package:wordy/domain/models/user_achievement.dart';
import 'package:wordy/global/notification_provider.dart';

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
  final StreamController<AchievementListResponse>
      _achievementNotificationController = StreamController.broadcast();

  StreamController<UserActiveCoursesProgress> get courseStreamController =>
      _courseStreamController;
  StreamController<ActiveCourse> get currentCourseStreamController =>
      _currentCourseStreamController;
  StreamController<AchievementListResponse>
      get achievemnetNotificationController =>
          _achievementNotificationController;

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

      _achievementNotificationController
          .add(AchievementListResponse.fromJson(data));
    });
  }
}
