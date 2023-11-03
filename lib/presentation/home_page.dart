import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:wordy/presentation/Bloc/vocabulary/vocabulary_bloc.dart';
import 'package:wordy/presentation/bloc/profile/profile_bloc.dart';

import 'package:wordy/presentation/screens/profile_screen.dart';

import 'package:wordy/presentation/screens/vocabulary_screen/vocabulary_screen.dart';
import 'package:wordy/const/consts.dart';

import '../Utility/locator/service_locator.dart';
import '../global/global_data_manager.dart';
import 'screens/courses_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int _currentScreenIndex = 0;

  final List<Widget> _currentScreen = [
    BlocProvider(
      create: (context) => ProfileBloc(),
      child: const CoursesScreen(),
    ),
    BlocProvider(
      create: (context) => VocabularyBloc(),
      child: const VocabularyScreen(),
    ),
    const ProfileScreen(),
  ];

  List<GButton> navBarsItems(String language) {
    return [
      GButton(
          onPressed: () {},
          text: translate[language]!['home_screen_app_bar'],
          icon: Icons.home),
      GButton(
        onPressed: () {},
        text: translate[language]!['vocabulary_screen_app_bar'],
        icon: Icons.book,
      ),
      GButton(
        onPressed: () {},
        text: translate[language]!['profile_screen_app_bar'],
        icon: Icons.person,
      ),
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: GNav(
                  tabActiveBorder: Border.all(color: Colors.indigo[400]!),
                  gap: 4,
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
                  tabs: navBarsItems(
                      locator<GlobalDataManager>().interfaceLanguage)),
            ),
          ),
        ),
        body: _currentScreen[_currentScreenIndex]);
  }
}
