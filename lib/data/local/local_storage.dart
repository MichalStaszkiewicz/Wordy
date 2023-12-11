import 'package:shared_preferences/shared_preferences.dart';

import '../../const/shared_preferences_keys.dart';

class LocalStorage {
  SharedPreferences sharedPreferences;

  LocalStorage(this.sharedPreferences);
  void cleanup() {
    setTokenAccess('');
    setTokenRefresh('');
  }

  String? getUserInterfaceLanguage() {
    final pref = sharedPreferences;
    final language = pref.getString(SharedPreferencesKeys.interfaceLanguage);
    return language;
  }

  void setUserInterfaceLanguage(String interfaceLang) {
    final pref = sharedPreferences;
    pref.setString(SharedPreferencesKeys.interfaceLanguage, interfaceLang);
  }

  String? getTokenAccess() {
    final pref = sharedPreferences;
    final id = pref.getString(SharedPreferencesKeys.tokenAccess);
    return id;
  }

  String? getTokenRefresh() {
    final pref = sharedPreferences;
    final id = pref.getString(SharedPreferencesKeys.tokenRefresh);
    return id;
  }

  void setTokenAccess(
    String token,
  ) async {
    final pref = sharedPreferences;
    await pref.setString(
      SharedPreferencesKeys.tokenAccess,
      token,
    );
  }

  void setTokenRefresh(
    String token,
  ) async {
    final pref = sharedPreferences;
    await pref.setString(
      SharedPreferencesKeys.tokenRefresh,
      token,
    );
  }
}
