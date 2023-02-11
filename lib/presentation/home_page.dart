import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordy/presentation/Bloc/settings/settings_bloc.dart';
import 'package:wordy/presentation/Bloc/vocabulary/vocabulary_bloc.dart';
import 'package:wordy/presentation/Widgets/unexpected_error.dart';
import 'package:wordy/presentation/screens/new_user_screen.dart';

import 'package:wordy/presentation/screens/profile_screen.dart';
import 'package:wordy/presentation/screens/settings_screen.dart';

import 'package:wordy/presentation/screens/vocabulary_screen.dart';
import 'package:wordy/presentation/Bloc/topics/topics_bloc.dart';

import 'Bloc/user_progress/user_progress_bloc.dart';
import 'screens/topic_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

int currentIndex = 0;
List<BottomNavigationBarItem> bottom_nav_items = [
  BottomNavigationBarItem(
    label: "",
    icon: Container(
        padding: const EdgeInsets.only(top: 10), child: const Icon(Icons.home)),
  ),
  BottomNavigationBarItem(
    label: "",
    icon: Container(
        padding: const EdgeInsets.only(top: 10), child: const Icon(Icons.book)),
  ),
  BottomNavigationBarItem(
    label: "",
    icon: Container(
        padding: const EdgeInsets.only(top: 10),
        child: const Icon(Icons.person)),
  ),
  BottomNavigationBarItem(
    label: "",
    icon: Container(
        padding: const EdgeInsets.only(top: 10),
        child: const Icon(Icons.settings)),
  ),
];

List<Widget> _currentScreen = [
  BlocProvider(
    create: (context) => TopicsBloc()..add(LoadTopics()),
    child: TopicScreen(),
  ),
  BlocProvider(
    create: (context) => VocabularyBloc()..add(LoadVocabulary()),
    child: VocabularyScreen(),
  ),
  BlocProvider(
    create: (context) => UserProgressBloc()..add(LoadUserDataAndPreferences()),
    child: ProfileScreen(),
  ),
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
              bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  iconSize: 24,
                  currentIndex: currentIndex,
                  onTap: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  items: bottom_nav_items),
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
