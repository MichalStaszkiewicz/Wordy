import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordy/Bloc/bloc_observer.dart';
import 'package:wordy/myapp.dart';

void main() {
  
  WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer  = SimpleBlocObserver();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}
