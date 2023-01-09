import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wordy/myapp.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}
