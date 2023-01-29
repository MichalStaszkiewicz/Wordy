import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wordy/presentation/Bloc/topics/topics_bloc.dart';
import 'package:wordy/presentation/Bloc/vocabulary/vocabulary_bloc.dart';
import 'package:wordy/presentation/screens/topic_screen.dart';

import 'package:wordy/presentation/home_page.dart';

import 'presentation/Bloc/user_progress/user_progress_bloc.dart';



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
            create: (context) => UserProgressBloc()
          )
        ],
        child: const HomePage(),
      ),
    );
  }
}
