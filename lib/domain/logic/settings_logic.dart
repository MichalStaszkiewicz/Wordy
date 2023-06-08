import 'package:wordy/domain/repositiories/repository.dart';
import 'package:wordy/presentation/widgets/settings.dart';

import '../../utility/either.dart';
import '../models/interface_language.dart';

class SettingsLogic {
  SettingsLogic(this._repository);

  final Repository _repository;
  Future<Either<Exception, List<InterfaceLanguage>>>
      getAvailableLanguages() async {
    var languages = await _repository.getAvailableLanguages();
    if (languages.isLeft) {
      return Either.left(languages.left!);
    }
    return Either.right(languages.right);
  }

  Future<Either<Exception, List<InterfaceLanguage>>>
      getAvailableLanguagesExceptCurrentUserLanguage() async {
    var availableLanguages = await _repository.getAvailableLanguages();
    if (availableLanguages.isLeft) {
      return Either.left(availableLanguages.left!);
    }
    var currentUserLanguage = await _repository.getUserInterfaceLanguage();
    if (currentUserLanguage.isLeft) {
      return Either.left(currentUserLanguage.left);
    }
    availableLanguages.right!.removeWhere((element) =>
        element.name.toLowerCase() == currentUserLanguage.right!.toLowerCase());
    return Either.right(availableLanguages.right);
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
