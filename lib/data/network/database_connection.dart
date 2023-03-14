import 'package:mysql1/mysql1.dart';

class ServerDatabaseConnection {
  static final ServerDatabaseConnection _instance =
      ServerDatabaseConnection._internal();
  final ConnectionSettings _settings = ConnectionSettings(
    useSSL: false,
    host: 'database-wordies.c4lkyyakktfu.eu-central-1.rds.amazonaws.com',
    port: 3306,
    user: 'admin',
    password: 'Scooter255f',
    db: 'wordies',
  );
  late MySqlConnection _connection;

  factory ServerDatabaseConnection() {
    return _instance;
  }

  ServerDatabaseConnection._internal();
  Future<MySqlConnection> connect() async {
    try {
 
        _connection = await MySqlConnection.connect(_settings);
      
    } catch (e) {
      print('Error connecting to the database: $e');
    }
    return _connection;
  }

  void close() {
    _connection.close();
  }
}
