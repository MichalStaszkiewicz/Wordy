import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wordy/const/app_router.dart';

import 'Utility/locator/service_locator.dart';
import 'domain/repositiories/stream_repository.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    locator<StreamRepository>().initialize();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        title: 'Wordy',
        theme: ThemeData(
          textTheme: GoogleFonts.robotoSlabTextTheme(),
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
