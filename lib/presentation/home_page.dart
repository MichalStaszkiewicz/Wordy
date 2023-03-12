import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animated_icons/icons8.dart';
import 'package:flutter_animated_icons/lottiefiles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lottie/lottie.dart';
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

import 'Widgets/loading_data.dart';
import 'screens/topic_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _homeController;
  late AnimationController _vocabularyController;
  late AnimationController _profileController;
  late AnimationController _settingsController;
  @override
  void initState() {
    super.initState();

    _homeController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _vocabularyController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _profileController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _settingsController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..repeat();
  }

  void dispose() {
    _homeController.dispose();
    _vocabularyController.dispose();
    _profileController.dispose();
    _settingsController.dispose();

    super.dispose();
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

  List<GButton> navBarsItems(String language) {
    return [
      GButton(
          onPressed: () {
            _homeController.reset();
            _homeController.forward();
          },
          text: ui_lang[language]!['home_screen_app_bar'],
          icon: Icons.home),
      GButton(
        text: ui_lang[language]!['vocabulary_screen_app_bar'],
        icon: Icons.book,
      ),
      GButton(
        text: ui_lang[language]!['profile_screen_app_bar'],
        icon: Icons.person,
      ),
      GButton(
        text: ui_lang[language]!['settings_screen_app_bar'],
        icon: Icons.settings,
      ),
    ];
  }

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
                        bottomNavigationBar: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 20,
                                color: Colors.black.withOpacity(.1),
                              )
                            ],
                          ),
                          child: SafeArea(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 22),
                              child: GNav(
                                  tabActiveBorder:
                                      Border.all(color: Colors.blueAccent),
                                  gap: 10,
                                  color: Colors.grey[600],
                                  activeColor: Colors.blueAccent,
                                  rippleColor: Colors.grey[300]!,
                                  hoverColor: Colors.grey[100]!,
                                  iconSize: 20,
                                  textStyle: const TextStyle(
                                      fontSize: 16, color: Colors.blueAccent),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 14.5),
                                  duration: const Duration(milliseconds: 800),
                                  selectedIndex: value.currentIndex,
                                  onTabChange: (index) {
                                    setState(() {
                                      value.setCurrentScreen(index);
                                    });
                                  },
                                  tabs: navBarsItems(value.interfaceLangauge)),
                            ),
                          ),
                        ),
                        body: _currentScreen[value.currentIndex],
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
