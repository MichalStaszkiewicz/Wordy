import 'package:wordy/utility/socket_manager.dart';

import '../../Utility/locator/service_locator.dart';

class SocketEventEmitter {
  final _socket = locator<SocketManager>().socket;
  SocketEventEmitter();
  Future<void> addCourse(String userId, dynamic course) async {
    _socket.emit('add_course', [userId, course]);
    return;
  }

  Future<void> joinRoom(
    String token,
  ) async {
    _socket.emit('joinRoom', [token]);
    return;
  }
}
