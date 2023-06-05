import 'package:get_it/get_it.dart';
import 'package:wordy/const/urls.dart';
import 'package:wordy/data/network/api_service.dart';
import 'package:wordy/domain/logic/settings_logic.dart';

import 'package:wordy/domain/logic/vocabulary_logic.dart';
import 'package:wordy/domain/models/vocabulary.dart';
import 'package:wordy/domain/repositiories/repository.dart';
import 'package:wordy/domain/repositiories/user_repository.dart';

import '../../domain/logic/quiz_logic.dart';
import '../../domain/logic/user_service.dart';

GetIt locator = GetIt.instance;

Future<void> logicLocator() async {
  locator.registerLazySingleton(
      () => QuizLogic(locator<Repository>(), locator<UserRepository>()));
  locator.registerLazySingleton(() => VocabularyLogic(locator<Repository>()));
  locator.registerLazySingleton(() => UserService(locator<Repository>()));
  locator.registerLazySingleton(() => SettingsLogic(locator<Repository>()));
}
