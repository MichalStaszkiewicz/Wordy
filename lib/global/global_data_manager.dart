class GlobalDataManager {
  void languageFromCode(String code) {
    if (code == 'en') {
      interfaceLanguage = "english";
    } else if (code == 'pl') {
      interfaceLanguage = "polish";
    } else if (code == 'es') {
      interfaceLanguage = "spanish";
    } else if (code == 'fr') {
      interfaceLanguage = 'french';
    } else {
      interfaceLanguage = 'english';
    }
  }

  String interfaceLanguage = '';
}
