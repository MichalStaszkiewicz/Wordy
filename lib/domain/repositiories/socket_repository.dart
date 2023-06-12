import 'dart:async';

import 'package:socket_io_client/socket_io_client.dart';

import '../../Utility/locator/service_locator.dart';
import '../models/active_course.dart';
import '../models/user_active_courses_progress.dart';

class StreamRepository {
  final Socket _socket = locator<Socket>();
  final StreamController<UserActiveCoursesProgress> _courseStreamController =
      StreamController<UserActiveCoursesProgress>.broadcast();
  final StreamController<ActiveCourse> _currentCourseStreamController =
      StreamController<ActiveCourse>.broadcast();

  StreamController<UserActiveCoursesProgress> get courseStreamController =>
      _courseStreamController;
  StreamController<ActiveCourse> get currentCourseStreamController =>
      _currentCourseStreamController;

  void initialize() {
    _socket.on('loadCourses', (data) {
      _courseStreamController.add(UserActiveCoursesProgress.fromJson(data));
    });
    _socket.on('current_course', (data) {
      currentCourseStreamController
          .add(ActiveCourse.fromJson(data['activeCourse']));
    });
  }
}
