import 'package:shared_preferences/shared_preferences.dart';

import '../../const/shared_preferences_keys.dart';

class LocalStorage {
  SharedPreferences sharedPreferences;

  LocalStorage(this.sharedPreferences);
  void cleanup() {
    setTokenAccess('');
    setTokenRefresh('');
    setUserInterfaceLanguage('');
  }

  String? getUserInterfaceLanguage() {
    final pref = sharedPreferences;
    final language = pref.getString(interfaceLanguage);
    return language;
  }

  Future<void> setUserInterfaceLanguage(String interfaceLang) async {
    final pref = sharedPreferences;
    pref.setString(interfaceLanguage, interfaceLang);
  }

  String? getTokenAccess() {
    final pref = sharedPreferences;
    final id = pref.getString(tokenAccess);
    return id;
  }

  Future<String?> getTokenRefresh() async {
    final pref = sharedPreferences;
    final id = pref.getString(tokenRefresh);
    return id;
  }

  void setTokenAccess(
    String token,
  ) async {
    final pref = sharedPreferences;
    await pref.setString(
      tokenAccess,
      token,
    );
  }

  void setTokenRefresh(
    String token,
  ) async {
    final pref = sharedPreferences;
    await pref.setString(
      tokenRefresh,
      token,
    );
  }
}
