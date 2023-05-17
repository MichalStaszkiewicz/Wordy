import 'package:get_it/get_it.dart';

import 'domain/models/user.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerSingleton<User>(User());
}
