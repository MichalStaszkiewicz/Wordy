import 'package:wordy/domain/models/user.dart';

import 'interface_language.dart';

class UserSettings {
  UserSettings({required this.language});

  InterfaceLanguage language;
}
