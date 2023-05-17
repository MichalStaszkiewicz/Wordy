import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/dropdown_alert.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wordy/const/app_router.dart';
import 'package:wordy/presentation/Bloc/topics/topics_bloc.dart';
import 'package:wordy/presentation/Bloc/vocabulary/vocabulary_bloc.dart';
import 'package:wordy/presentation/provider/interface_language_provider.dart';
import 'package:wordy/presentation/screens/auth_screen.dart';
import 'package:wordy/presentation/widgets/loading_data.dart';
import 'package:wordy/presentation/screens/language_to_learn_from_screen.dart';
import 'package:wordy/presentation/screens/language_to_learn_screen.dart';
import 'package:wordy/presentation/screens/quiz_screen.dart';
import 'package:wordy/presentation/screens/settings_screen.dart';
import 'package:wordy/presentation/screens/topic_screen.dart';

import 'package:wordy/presentation/home_page.dart';
import 'package:wordy/presentation/screens/vocabulary_screen.dart';

import 'presentation/Bloc/user_progress/user_progress_bloc.dart';
import 'presentation/screens/profile_screen.dart';

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
