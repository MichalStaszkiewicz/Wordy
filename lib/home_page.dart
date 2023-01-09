import 'package:flutter/material.dart';
import 'package:wordy/SettingsScreen/settings_screen.dart';
import 'package:wordy/TopicScreen/progression_bar.dart';
import 'package:wordy/TopicScreen/topic_grid_view.dart';
import 'package:wordy/VocabularyScreen/vocabulary_screen.dart';

import 'TopicScreen/topic_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

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
        child: const Icon(Icons.settings)),
  ),
];
int currentIndex = 0;
List<Widget> _currentScreen = [TopicScreen(),VocabularyScreen(),SettingsScreen()];
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: bottom_nav_items),
      body:_currentScreen[currentIndex],
    );
  }
}
