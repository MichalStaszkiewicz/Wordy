import 'dart:async';

import 'package:socket_io_client/socket_io_client.dart';
import 'package:wordy/data/dto/active_course_response.dart';
import 'package:wordy/data/dto/user_active_courses_progress_response.dart';

import '../../Utility/locator/service_locator.dart';

class StreamRepository {
  final Socket _socket = locator<Socket>();
  final StreamController<UserActiveCoursesProgressResponse>
      _courseStreamController =
      StreamController<UserActiveCoursesProgressResponse>.broadcast();
  final StreamController<ActiveCourseResponse> _currentCourseStreamController =
      StreamController<ActiveCourseResponse>.broadcast();

  StreamController<UserActiveCoursesProgressResponse>
      get courseStreamController => _courseStreamController;
  StreamController<ActiveCourseResponse> get currentCourseStreamController =>
      _currentCourseStreamController;

  void initialize() {
    _socket.on('loadCourses', (data) {
      _courseStreamController
          .add(UserActiveCoursesProgressResponse.fromJson(data));
    });
    _socket.on('current_course', (data) {
      currentCourseStreamController
          .add(ActiveCourseResponse.fromJson(data['activeCourse']));
    });
  }
}
