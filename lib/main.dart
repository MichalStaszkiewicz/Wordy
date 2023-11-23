import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:socket_io_client/socket_io_client.dart';

import 'package:wordy/app.dart';
import 'package:wordy/Utility/observers/bloc_observer.dart';
import 'package:wordy/utility/locator/service_locator.dart';

import 'Utility/socket_manager.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) async {
    if (!kReleaseMode) {
      String apiUrl = dotenv.get("API_URL_DEBUG");
      String apiUrlImages = dotenv.get("API_URL_IMAGES_DEBUG");
      await serviceLocator(apiUrl, apiUrlImages,false);
      print("debug mode");
    } else {
      String apiUrl = dotenv.get("API_URL_PRODUCTION");
      String apiUrlImages = dotenv.get("API_URL_IMAGES_PRODUCTION");
      await serviceLocator(apiUrl, apiUrlImages,false);
      print("release mode");
    }

    locator.registerLazySingleton<SocketManager>(
        () => SocketManager(locator<Socket>()));

    runApp(const App(
      key: Key("App"),
    ));
  });
}
