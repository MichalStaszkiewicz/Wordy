import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wordy/const/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

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
