import 'package:socket_io_client/socket_io_client.dart';

import '../data/network/request/quiz_summary_request.dart';

class SocketManager {
  final Socket socket;
  SocketManager(this.socket);
  void initialize(String token) async {
    socket.connect();
  }

  void joinRoom(String token) async {
    socket.emit('joinRoom', [token]);
  }

  void quizSummary(QuizSummary data) async {
    socket.emit('quiz_summary', [data.toJson()]);
  }

  void loggedIn(String token) async {
    socket.emit('topic_screen_load_courses', [token]);
  }

  void loadCurrentCourse(String token) {
    socket.emit('load_current_course', [token]);
  }

  void connect() {
    socket.connect();
  }

  void disconnect() {
    socket.disconnect();
  }
}
