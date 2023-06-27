import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:wordy/global/course_progress_tracker.dart';
import 'package:wordy/global/global_data_manager.dart';

import '../../const/urls.dart';
import '../../data/local/local_storage.dart';
import '../../data/network/api_service.dart';
import '../../data/network/remote_source.dart';

import '../../domain/logic/quiz_logic.dart';
import '../../domain/logic/settings_logic.dart';
import '../../domain/logic/user_service.dart';
import '../../domain/logic/vocabulary_logic.dart';
import '../../domain/repositiories/repository.dart';
import '../../domain/repositiories/stream_repository.dart';

import '../socket_manager.dart';

GetIt locator = GetIt.instance;

Future<void> serviceLocator() async {
  locator.registerLazySingleton(
      () => QuizLogic(locator<Repository>(), locator<UserService>()));
  locator.registerLazySingleton(() => VocabularyService(locator<Repository>()));
  locator.registerLazySingleton(() => UserService(locator<Repository>()));
  locator.registerLazySingleton(() => SettingsLogic(locator<Repository>()));
  locator.registerLazySingleton(() => ApiService(baseUrl: Urls.kBaseUrl));
  locator.registerLazySingleton(() => CourseProgressTracker());
  locator.registerLazySingleton(() => GlobalDataManager());
  locator.registerLazySingleton(() => io(Urls.kBaseUrl, <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false,
        'reconnection': true,
        'reconnectionDelay': 1000,
        'reconnectionDelayMax': 5000,
        'reconnectionAttempts': 99999
      }));

  final pref = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => LocalStorage(pref));

  locator.registerLazySingleton(() => RemoteSource(locator<ApiService>()));
  locator.registerLazySingleton(
      () => Repository(locator<LocalStorage>(), locator<RemoteSource>()));

  locator.registerSingleton<SocketManager>(SocketManager(locator<Socket>()));

  locator.registerLazySingleton(() => StreamRepository());
}
