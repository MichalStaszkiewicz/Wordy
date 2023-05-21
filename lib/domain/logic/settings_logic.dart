import 'package:wordy/data/local/local_repository_implementation.dart';
import 'package:wordy/domain/repositiories/repository.dart';
import 'package:wordy/presentation/widgets/settings.dart';

import '../models/language.dart';

class SettingsLogic {
  SettingsLogic();
  LocalRepository localRepository = LocalRepository();
  Repository _repository = Repository();
  Future<List<Language>> getAvailableLanguages() async {
    return await _repository
        .getAvailableLanguages()
        .then((value) => value.languages.map((e) => e.toDomain()).toList());
  }

  Future<List<Language>> getAvailableLanguagesExcept(String name) async {
    List<Language> availableLanguages = await _repository
        .getAvailableLanguages()
        .then((value) => value.languages.map((e) => e.toDomain()).toList());
    availableLanguages.removeWhere(
        (element) => element.name.toLowerCase() == name.toLowerCase());
    return availableLanguages;
  }

  Future<bool> getUserTheme() async {
    Map<String, dynamic> userData = await localRepository.getUserData();
    String theme = userData['themeMode']!;
    if (theme == "light") {
      return false;
    } else {
      return true;
    }
  }

  Future<String> getUserInterfaceLanguage() async {
    Map<String, dynamic> userData = await localRepository.getUserData();

    return userData['interfaceLanguage']!;
  }

  void updateUserTheme(bool theme) {
    String themeMode;
    if (theme == false) {
      themeMode = "light";
    } else {
      themeMode = "dark";
    }
    localRepository.updateUserProfile('themeMode', themeMode);
  }

  void updateUserInterfaceLanguage(String interfaceLanguage) {
    localRepository.updateUserProfile("interfaceLanguage", interfaceLanguage);
  }
}
