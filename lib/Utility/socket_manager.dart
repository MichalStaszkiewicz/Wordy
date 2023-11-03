import 'package:socket_io_client/socket_io_client.dart';

import '../data/network/request/quiz_summary_request.dart';
import '../data/network/response/refresh_room_request.dart';

class SocketManager {
  final Socket socket;

  SocketManager(this.socket);

  void initialize(String token) async {
    socket.io.options['extraHeaders'] = {
      'Authorization': {token}
    };

    joinRoom(token);
    print("LOGIN USER WITH TOKEN : " + token);
    connect();
  }

  void joinRoom(String token) async {
    socket.io.options['extraHeaders'] = {
      'Authorization': {token}
    };
    socket.emit('joinRoom', [token]);
  }

  void refreshToken(RefreshRoomRequest data) async {
    socket.io.options['extraHeaders'] = {'Authorization': data.oldToken};
    socket.emit('token_refresh', [data.toJson()]);
  }

  void quizSummary(QuizSummary data) async {
    socket.io.options['extraHeaders'] = {
      'Authorization': {data.token}
    };
    socket.emit('quiz_summary', [data.toJson()]);
  }

  void logOut(String token) {
    socket.io.options['extraHeaders'] = {'Authorization': token};
    socket.emit('logout', [token]);
  }

  void loadTopics(String token) async {
    socket.io.options['extraHeaders'] = {'Authorization': token};

    socket.emit('topic_screen_load_courses', [token]);
  }

  void loadCurrentCourse(String token) {
    socket.io.options['extraHeaders'] = {'Authorization': token};
    socket.emit('load_current_course', [token]);
  }

  void connect() {
    socket.connect();
  }

  void disconnect() {
    socket.disconnect();
  }
}
