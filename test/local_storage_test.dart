import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordy/const/shared_preferences_keys.dart';

import 'package:wordy/data/local/local_storage.dart';
import 'package:wordy/domain/models/interface_language.dart';
import 'package:wordy/global/global_data_manager.dart';
import 'package:wordy/utility/locator/service_locator.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const tokenAccess = '12345';
  const tokenRefresh = '54321';
  const InterfaceLanguage = 'english';
  setUpAll(() => {SharedPreferences.setMockInitialValues({})});
  group('LocalStorage', () {
    test('setTokenAccess, getTokenAccess', () async {
      SharedPreferences pref = await SharedPreferences.getInstance();

      pref.setString(SharedPreferencesKeys.tokenAccess, tokenAccess);
      expect(pref.getString(SharedPreferencesKeys.tokenAccess), tokenAccess);
    });
    test('setTokenRefresh, getTokenRefresh', () async {
      SharedPreferences pref = await SharedPreferences.getInstance();

      pref.setString(SharedPreferencesKeys.tokenRefresh, tokenRefresh);
      expect(pref.getString(SharedPreferencesKeys.tokenRefresh), tokenRefresh);
    });
    test('setUserInterfaceLanguage, getUserInterfaceLanguage', () async {
      SharedPreferences pref = await SharedPreferences.getInstance();

      pref.setString(
          SharedPreferencesKeys.interfaceLanguage, InterfaceLanguage);
      expect(pref.getString(SharedPreferencesKeys.interfaceLanguage),
          InterfaceLanguage);
    });
    test('cleanup', () async {
      SharedPreferences pref = await SharedPreferences.getInstance();

      pref.setString(SharedPreferencesKeys.tokenAccess, '');
      pref.setString(SharedPreferencesKeys.tokenRefresh, '');
      expect(pref.getString(SharedPreferencesKeys.tokenAccess), '');
      expect(pref.getString(SharedPreferencesKeys.tokenRefresh), '');
    });
  });
}
