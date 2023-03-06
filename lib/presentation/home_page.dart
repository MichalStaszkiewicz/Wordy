import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:wordy/presentation/Bloc/settings/settings_bloc.dart';
import 'package:wordy/presentation/Bloc/vocabulary/vocabulary_bloc.dart';
import 'package:wordy/presentation/Widgets/unexpected_error.dart';
import 'package:wordy/presentation/screens/new_user_screen.dart';

import 'package:wordy/presentation/screens/profile_screen.dart';
import 'package:wordy/presentation/screens/settings_screen.dart';

import 'package:wordy/presentation/screens/vocabulary_screen.dart';
import 'package:wordy/presentation/Bloc/topics/topics_bloc.dart';
import 'package:wordy/shared/consts.dart';

import 'Bloc/user_progress/user_progress_bloc.dart';
import 'Provider/interface_language_provider.dart';
import 'screens/topic_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

int currentIndex = 0;
List<PersistentBottomNavBarItem> navBarsItems(String language) {
  return [
    PersistentBottomNavBarItem(
      icon: Icon(Icons.home),
      title: (ui_lang[language]!['home_screen_app_bar']),
      activeColorPrimary: Colors.blue,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.book),
      title: (ui_lang[language]!['vocabulary_screen_app_bar']),
      activeColorPrimary: Colors.blue,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.person),
      title: (ui_lang[language]!['profile_screen_app_bar']),
      activeColorPrimary: Colors.blue,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.settings),
      title: (ui_lang[language]!['settings_screen_app_bar']),
      activeColorPrimary: Colors.blue,
      inactiveColorPrimary: Colors.grey,
    ),
  ];
}

List<Widget> _currentScreen = [
  BlocProvider(
    create: (context) =>
        UserProgressBloc()..add(LoadUserSettingsAndCourseInformations()),
    child: TopicScreen(),
  ),
  Consumer<InterfaceLanguageProvider>(
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

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserProgressBloc(),
      child: BlocBuilder<UserProgressBloc, UserProgressState>(
        builder: (context, state) {
          if (state is UserProgressInitial) {
            context
                .read<UserProgressBloc>()
                .add(LoadUserPreferencesOrCreateNewUser());
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is UserProgressLoaded) {
            return Scaffold(
              bottomNavigationBar: Consumer<InterfaceLanguageProvider>(
                builder: (context, value, child) => PersistentTabView(
                  context,
                  navBarHeight: 80,
                  items: navBarsItems(value.interfaceLangauge),
                  controller:
                      PersistentTabController(initialIndex: currentIndex),
                  onItemSelected: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  navBarStyle: NavBarStyle.style3,
                  screens: _currentScreen,
                ),
              ),
              body: _currentScreen[currentIndex],
            );
          }

          if (state is CreatingNewUserPreferences) {
            return const NewUserScreen();
          } else {
            return UnexpectedError();
          }
        },
      ),
    );
  }
}
