import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/dropdown_alert.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wordy/presentation/Bloc/topics/topics_bloc.dart';
import 'package:wordy/presentation/Bloc/vocabulary/vocabulary_bloc.dart';
import 'package:wordy/presentation/Provider/interface_language_provider.dart';
import 'package:wordy/presentation/Widgets/loading_data.dart';
import 'package:wordy/presentation/screens/language_to_learn_from_screen.dart';
import 'package:wordy/presentation/screens/language_to_learn_screen.dart';
import 'package:wordy/presentation/screens/quiz_screen.dart';
import 'package:wordy/presentation/screens/settings_screen.dart';
import 'package:wordy/presentation/screens/topic_screen.dart';

import 'package:wordy/presentation/home_page.dart';
import 'package:wordy/presentation/screens/vocabulary_screen.dart';

import 'presentation/Bloc/user_progress/user_progress_bloc.dart';
import 'presentation/screens/profile_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        '/home': (context) => const HomePage(),
        '/topic': (context) => TopicScreen(),
        '/vocabulary': (context) => const VocabularyScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Wordy',
      theme: ThemeData(
        textTheme: GoogleFonts.robotoSlabTextTheme(),
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<void>(
        future: Provider.of<InterfaceDataProvider>(context, listen: false)
            .getUserInterfaceLanguage(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(backgroundColor: Colors.white, body: LoadingData());
          }
          if (snapshot.hasError) {
            return Scaffold(
                backgroundColor: Colors.white,
                body: Center(child: Text('Error: ${snapshot.error}')));
          }
          return const HomePage();
        },
      ),
    );
  }
}
