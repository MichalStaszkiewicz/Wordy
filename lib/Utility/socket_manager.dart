import 'package:socket_io_client/socket_io_client.dart';

class SocketManager {
  final Socket socket;
  SocketManager(this.socket);

  void initialize() async {
    socket.on('connect', (data) {});
  }

  void joinRoom(String userId) async {
    socket.emit('joinRoom', [userId]);
  }

  void loggedIn(String userId) async {
    socket.emit('topic_screen_load_courses', [userId]);
  }

  void loadCurrentCourse(String userId) {
    socket.emit('load_current_course', [userId]);
  }

  void connect() {
    socket.connect();
  }

  void disconnect() {
    socket.disconnect();
  }
}
