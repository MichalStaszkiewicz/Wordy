import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wordy/TopicScreen/topic_screen.dart';
import 'package:wordy/bloc/topics/topics_bloc.dart';
import 'package:wordy/bloc/vocabulary/vocabulary_bloc.dart';
import 'package:wordy/home_page.dart';

import 'Bloc/user_settings_and_preferences/user_settings_and_preferences_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        '/home': (context) => TopicScreen(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(),
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => VocabularyBloc()..add(LoadVocabulary()),
          ),
          BlocProvider(
            create: (context) => TopicsBloc()..add(LoadTopics()),
          ),
          BlocProvider(
            create: (context) => UserSettingsAndPreferencesBloc()
          )
        ],
        child: const HomePage(),
      ),
    );
  }
}
