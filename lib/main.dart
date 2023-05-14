import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:wordy/app.dart';
import 'package:wordy/Utility/observers/bloc_observer.dart';
import 'package:wordy/localizator.dart';
import 'package:wordy/presentation/provider/interface_language_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  setupLocator();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
      (value) => runApp(ChangeNotifierProvider(
          create: (BuildContext context) => InterfaceDataProvider(),
          child: const App())));
}
