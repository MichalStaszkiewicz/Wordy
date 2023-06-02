import 'package:get_it/get_it.dart';
import 'package:wordy/const/urls.dart';
import 'package:wordy/data/network/api_service.dart';

GetIt locator = GetIt.instance;

Future<void> apiLocator() async {
  locator.registerLazySingleton(() => ApiService(baseUrl: Urls.kBaseUrl));
}
