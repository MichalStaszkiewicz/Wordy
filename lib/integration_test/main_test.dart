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
  testWidgets('navigation between login forms', (tester) async {
    AuthScreen authScreen = AuthScreen(
      key: const Key('auth_screen'),
    );
    await tester.pumpWidget(MaterialApp(home: authScreen));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('auth_screen')), findsWidgets);

    
  });
}
