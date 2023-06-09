import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:socket_io_client/socket_io_client.dart';

import 'package:wordy/app.dart';
import 'package:wordy/Utility/observers/bloc_observer.dart';
import 'package:wordy/utility/locator/service_locator.dart';

import 'Utility/socket_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) async {
    await serviceLocator();

    locator.registerLazySingleton<SocketManager>(
        () => SocketManager(locator<Socket>()));

    runApp(const App());
  });
}
