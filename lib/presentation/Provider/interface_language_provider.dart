import 'package:flutter/material.dart';
import 'package:wordy/data/local/local_repository_implementation.dart';

class InterfaceDataProvider with ChangeNotifier {
  LocalRepository _localRepository = LocalRepository();
  int currentIndex = 0;
  String interfaceLangauge = "English";
  bool darkMode = false;

  void setCurrentScreen(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void setThemeMode() {
    darkMode = !darkMode;
    notifyListeners();
  }
/*
  Future<void> getUserInterfaceLanguage() async {
    await _localRepository
        .createDatabase("English", "Polish")
        .then((value) async {
      Map<String, dynamic> userData = await _localRepository.getUserData();
      interfaceLangauge = userData["interfaceLanguage"]!;
    });
  }
  */

  Future<void> changeUserInterfaceLanguage(String language) async {
    _localRepository.updateUserProfile("interfaceLanguage", language);
    interfaceLangauge = language;
    notifyListeners();
  }
  
}
