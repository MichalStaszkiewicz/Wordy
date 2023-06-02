import 'package:shared_preferences/shared_preferences.dart';

import '../../const/shared_preferences_keys.dart';

class LocalStorage {
  SharedPreferences sharedPreferences;

  LocalStorage(this.sharedPreferences);

  Future<String?> getUserInterfaceLanguage() async {
    final pref = sharedPreferences;
    final language = pref.getString(interfaceLanguage);
    return language;
  }

  Future<void> setUserInterfaceLanguage(String interfaceLang) async {
    final pref = sharedPreferences;
    pref.setString(interfaceLanguage, interfaceLang);
  }

  Future<String?> getUserId() async {
    final pref = sharedPreferences;
    final id = pref.getString(userId);
    return id;
  }

  void setUserId(
    String id,
  ) async {
    final pref = sharedPreferences;
    await pref.setString(
      userId,
      id,
    );
  }
}
