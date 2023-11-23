import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wordy/app.dart';
import 'package:wordy/domain/repositiories/stream_repository.dart';
import 'package:wordy/global/global_data_manager.dart';
import 'package:wordy/presentation/screens/auth_screen/forms/auth_screen.dart';
import 'package:wordy/presentation/screens/auth_screen/forms/login_form.dart';
import 'package:wordy/utility/locator/service_locator.dart';

void main() {
  setUp(() async => {
        await serviceLocator('http://192.168.55.106:1344',
            'http://192.168.55.106:1344/v1/images/', true),
        locator<StreamRepository>().initialize(),
        locator<GlobalDataManager>().interfaceLanguage = 'english'
      });
  testWidgets('navigation between login form and register form',
      (tester) async {
    await tester.pumpWidget(App(key: Key('App')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('login_form_go_to_register_button_key')),
        findsWidgets);
    final registerButton =
        find.byKey(Key('login_form_go_to_register_button_key'));
    await tester.tap(registerButton);
    await tester.pumpAndSettle();

    expect(find.byKey(Key('create_account_title_key')), findsWidgets);
    await tester.tap(find.byKey(
      Key('register_form_go_to_login_button_key'),
    ));
    await tester.pumpAndSettle();
    expect(find.byKey(Key('login_form_title_key')), findsWidgets);
  });
}
