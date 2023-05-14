import 'package:wordy/data/local/local_repository_implementation.dart';
import 'package:wordy/presentation/widgets/settings.dart';

class SettingsLogic {
  SettingsLogic();
  LocalRepository localRepository = LocalRepository();
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
  void updateUserInterfaceLanguage(String interfaceLanguage){
    localRepository.updateUserProfile("interfaceLanguage",interfaceLanguage);



  }
}
