import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordy/const/urls.dart';
import 'package:wordy/data/local/local_storage.dart';
import 'package:wordy/data/network/api_service.dart';
import 'package:wordy/data/network/remote_source.dart';

import '../../domain/repositiories/repository.dart';

GetIt locator = GetIt.instance;
Future<void> storageLocator() async {
  final pref = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => LocalStorage(pref));

  locator.registerLazySingleton(() => RemoteSource(locator<ApiService>()));
  locator.registerLazySingleton(
      () => Repository(locator<LocalStorage>(), locator<RemoteSource>()));
}
