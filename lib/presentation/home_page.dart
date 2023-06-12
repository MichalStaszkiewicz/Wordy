import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:wordy/presentation/Bloc/settings/settings_bloc.dart';
import 'package:wordy/presentation/Bloc/vocabulary/vocabulary_bloc.dart';
import 'package:wordy/presentation/bloc/profile/profile_bloc.dart';

import 'package:wordy/presentation/screens/profile_screen.dart';
import 'package:wordy/presentation/screens/settings_screen.dart';

import 'package:wordy/presentation/screens/vocabulary_screen.dart';
import 'package:wordy/const/consts.dart';

import 'bloc/courses_update/courses_update_bloc.dart';
import 'screens/topic_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int _currentScreenIndex = 0;
  final List<Widget> _currentScreen = [
    BlocProvider(
      create: (context) => ProfileBloc(),
      child: const TopicScreen(),
    ),
    BlocProvider(
      create: (context) => VocabularyBloc(),
      child: const VocabularyScreen(),
    ),
    const ProfileScreen(),
    BlocProvider(
      create: (context) => SettingsBloc()..add(const LoadSettings()),
      child: const SettingsScreen(),
    ),
  ];

  List<GButton> navBarsItems(String language) {
    return [
      GButton(
          onPressed: () {},
          text: ui_lang[language]!['home_screen_app_bar'],
          icon: Icons.home),
      GButton(
        onPressed: () {},
        text: ui_lang[language]!['vocabulary_screen_app_bar'],
        icon: Icons.book,
      ),
      GButton(
        onPressed: () {},
        text: ui_lang[language]!['profile_screen_app_bar'],
        icon: Icons.person,
      ), /*
      GButton(
        text: ui_lang[language]!['settings_screen_app_bar'],
        icon: Icons.settings,
      ),
      */
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 22),
              child: GNav(
                  tabActiveBorder: Border.all(color: Colors.indigo[400]!),
                  gap: 10,
                  color: Colors.grey[600],
                  activeColor: Colors.indigo[400],
                  rippleColor: Colors.grey[300]!,
                  hoverColor: Colors.grey[100]!,
                  iconSize: 20,
                  textStyle: TextStyle(fontSize: 16, color: Colors.indigo[400]),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 14.5),
                  duration: const Duration(milliseconds: 800),
                  selectedIndex: _currentScreenIndex,
                  onTabChange: (index) {
                    setState(() {
                      if (mounted) {
                        _currentScreenIndex = index;
                      }
                    });
                  },
                  tabs: navBarsItems('english')),
            ),
          ),
        ),
        body: _currentScreen[_currentScreenIndex]);
  }
}
