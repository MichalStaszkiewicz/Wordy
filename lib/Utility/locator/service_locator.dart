import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart';


import 'package:wordy/global/global_data_manager.dart';
import 'package:wordy/global/selected_course_notifier.dart';
import 'package:wordy/utility/dialog_manager.dart';

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

class MockSharedPreferences extends Mock implements SharedPreferences {}

Future<void> serviceLocator(String baseUrl, String imageUrl, bool test) async {
  locator.registerLazySingleton(() => Urls(baseUrl, imageUrl));
  locator.registerLazySingleton(
      () => QuizLogic(locator<Repository>(), locator<UserService>()));
  locator.registerLazySingleton(() => VocabularyService(locator<Repository>()));
  locator.registerLazySingleton(() => UserService(locator<Repository>()));
  locator.registerLazySingleton(() => SettingsLogic(locator<Repository>()));
  locator.registerLazySingleton(
      () => ApiService(baseUrl: locator<Urls>().baseUrl));
  locator.registerLazySingleton(() => SelectedCourseNotifier());
  locator.registerSingleton(DialogManager());
  locator.registerLazySingleton(() => GlobalDataManager());
  locator.registerLazySingleton(
      () => io(locator<Urls>().baseUrl, <String, dynamic>{
            'transports': ['websocket'],
            'autoConnect': false,
            'reconnection': true,
            'reconnectionDelay': 1000,
            'reconnectionDelayMax': 5000,
            'reconnectionAttempts': 99999
          }));
  if (!test) {
    final pref = await SharedPreferences.getInstance();
    locator.registerLazySingleton(() => LocalStorage(pref));
    locator.registerLazySingleton(
        () => Repository(locator<LocalStorage>(), locator<RemoteSource>()));
  } else {
    locator.registerLazySingleton(() => LocalStorage(MockSharedPreferences()));
    locator.registerLazySingleton(
        () => Repository(locator<LocalStorage>(), locator<RemoteSource>()));
  }

  locator.registerLazySingleton(() => RemoteSource(locator<ApiService>()));

  locator.registerSingleton<SocketManager>(SocketManager(locator<Socket>()));

  locator.registerLazySingleton(() => StreamRepository(locator<Socket>()));
}
