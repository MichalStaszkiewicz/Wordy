import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wordy/const/app_router.dart';
import 'package:wordy/utility/locator/api_locator.dart';
import 'package:wordy/utility/locator/logic_locator.dart';
import 'package:wordy/utility/locator/storage_locator.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await apiLocator();
      await storageLocator();
      await logicLocator();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      title: 'Wordy',
      theme: ThemeData(
        textTheme: GoogleFonts.robotoSlabTextTheme(),
        primarySwatch: Colors.blue,
      ),
    );
  }
}
