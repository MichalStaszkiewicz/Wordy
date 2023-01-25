import 'package:mysql1/mysql1.dart';

class ServerDatabaseConnection {
  static final ServerDatabaseConnection _instance =
      ServerDatabaseConnection._internal();
  final ConnectionSettings _settings = ConnectionSettings(
    host: '34.116.212.168',
    port: 3306,
    user: 'root',
    password: '1337',
    db: 'wordy-database',
  );
  late MySqlConnection _connection;

  factory ServerDatabaseConnection() {
    return _instance;
  }

  ServerDatabaseConnection._internal();

  Future<MySqlConnection> connect() async {
  
      _connection = await MySqlConnection.connect(_settings);
    
    return _connection;
  }

  void close() {
    _connection.close();
  }
}
