import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:wordy/presentation/Bloc/quiz/quiz_bloc.dart';
import 'package:wordy/presentation/Bloc/settings/settings_bloc.dart';
import 'package:wordy/presentation/Bloc/vocabulary/vocabulary_bloc.dart';
import 'package:wordy/presentation/Widgets/unexpected_error.dart';
import 'package:wordy/presentation/screens/new_user_screen.dart';

import 'package:wordy/presentation/screens/profile_screen.dart';
import 'package:wordy/presentation/screens/quiz_screen.dart';
import 'package:wordy/presentation/screens/settings_screen.dart';

import 'package:wordy/presentation/screens/vocabulary_screen.dart';
import 'package:wordy/presentation/Bloc/topics/topics_bloc.dart';
import 'package:wordy/shared/consts.dart';

import 'Bloc/user_progress/user_progress_bloc.dart';
import 'Provider/interface_language_provider.dart';
import 'Widgets/custom_bottom_navigation_bar.dart';
import 'Widgets/loading_data.dart';
import 'screens/topic_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  final List<Widget> _currentScreen = [
    BlocProvider(
      create: (context) =>
          UserProgressBloc()..add(LoadUserSettingsAndCourseInformations()),
      child: TopicScreen(),
    ),
    Consumer<InterfaceDataProvider>(
      builder: (context, value, child) => BlocProvider(
        create: (context) => VocabularyBloc()
          ..add(LoadVocabulary(language: value.interfaceLangauge)),
        child: VocabularyScreen(),
      ),
    ),
    ProfileScreen(),
    BlocProvider(
      create: (context) => SettingsBloc()..add(const LoadSettings()),
      child: SettingsScreen(),
    ),
  ];



 
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserProgressBloc(),
        ),
        BlocProvider(
          create: (context) => QuizBloc(),
        ),
      ],
      child: BlocBuilder<UserProgressBloc, UserProgressState>(
        builder: (context, userState) => BlocBuilder<QuizBloc, QuizState>(
          builder: (context, quizState) {
            if (userState is UserProgressInitial) {
              context
                  .read<UserProgressBloc>()
                  .add(LoadUserPreferencesOrCreateNewUser());
              return Scaffold(
                  backgroundColor: Colors.white, body: LoadingData());
            } else if (userState is UserProgressLoaded) {
              return Consumer<InterfaceDataProvider>(
                  builder: (context, value, child) => Scaffold(
                        bottomNavigationBar: CustomBottomNavigationBar(
                     
                        ),
                        body: _currentScreen[value.currentScreen],
                      ));
            } else if (userState is CreatingNewUserPreferences) {
              return const NewUserScreen();
            } else {
              return UnexpectedError();
            }
          },
        ),
      ),
    );
  }
}
