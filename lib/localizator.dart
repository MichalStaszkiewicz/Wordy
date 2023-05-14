import 'package:get_it/get_it.dart';
import 'package:wordy/utility/user_manager.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerSingleton(UserManager);
}
