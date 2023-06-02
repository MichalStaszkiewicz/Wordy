import 'package:wordy/domain/repositiories/repository.dart';
import 'package:wordy/presentation/widgets/settings.dart';

import '../models/interface_language.dart';

class SettingsLogic {
  SettingsLogic(this._repository);

  final Repository _repository;
  Future<List<InterfaceLanguage>> getAvailableLanguages() async {
    return await _repository
        .getAvailableLanguages()
        .then((value) => value.languages.map((e) => e.toDomain()).toList());
  }

  Future<List<InterfaceLanguage>> getAvailableLanguagesExcept(
      String name) async {
    List<InterfaceLanguage> availableLanguages = await _repository
        .getAvailableLanguages()
        .then((value) => value.languages.map((e) => e.toDomain()).toList());
    availableLanguages.removeWhere(
        (element) => element.name.toLowerCase() == name.toLowerCase());
    return availableLanguages;
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
