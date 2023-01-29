import 'package:mysql1/mysql1.dart';

class ServerDatabaseConnection {
  static final ServerDatabaseConnection _instance =
      ServerDatabaseConnection._internal();
  final ConnectionSettings _settings = ConnectionSettings(
    useSSL: false,
    host: 'wordies-server.mysql.database.azure.com',
    port: 3306,
    user: 'lodomir562',
    password: 'Scooter255f',
    db: 'wordies-db',
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
