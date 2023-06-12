import 'package:wordy/domain/repositiories/repository.dart';

import '../../utility/either.dart';
import '../models/interface_language.dart';

class SettingsLogic {
  SettingsLogic(this._repository);

  final Repository _repository;
  Future<Either<Exception, List<InterfaceLanguage>>>
      getAvailableLanguages() async {
    var languages = await _repository.getAvailableLanguages();
    if (languages.isError) {
      return Either.error(languages.error!);
    }
    return Either.data(languages.data);
  }

  Future<Either<Exception, List<InterfaceLanguage>>>
      getAvailableLanguagesExceptCurrentUserLanguage() async {
    var availableLanguages = await _repository.getAvailableLanguages();
    if (availableLanguages.isError) {
      return Either.error(availableLanguages.error!);
    }
    var currentUserLanguage = await _repository.getUserInterfaceLanguage();
    if (currentUserLanguage.isError) {
      return Either.error(currentUserLanguage.error);
    }
    availableLanguages.data!.removeWhere((element) =>
        element.name.toLowerCase() == currentUserLanguage.data!.toLowerCase());
    return Either.data(availableLanguages.data);
  }

  Future<bool> getUserTheme() async {
    /*
    Map<String, dynamic> userData = await localRepository.getUserData();
    String theme = userData['themeMode']!;
    if (theme == "light") {
      return false;
    } else {
      return true;
    }*/
    return false;
  }

  Future<String> getUserInterfaceLanguage() async {
    /*
    Map<String, dynamic> userData = await localRepository.getUserData();

    return userData['interfaceLanguage']!;
    */
    return "English";
  }

  void updateUserTheme(bool theme) {
    /*
    String themeMode;
    if (theme == false) {
      themeMode = "light";
    } else {
      themeMode = "dark";
    }
    localRepository.updateUserProfile('themeMode', themeMode);*/
  }

  void updateUserInterfaceLanguage(String interfaceLanguage) {
    //   localRepository.updateUserProfile("interfaceLanguage", interfaceLanguage);
  }
}
