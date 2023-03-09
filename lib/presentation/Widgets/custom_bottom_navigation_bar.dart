import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';
import 'package:provider/provider.dart';
import 'package:wordy/presentation/Provider/interface_language_provider.dart';
import 'package:wordy/presentation/Widgets/bottom_navigation_entry.dart';

import '../../shared/consts.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  CustomBottomNavigationBar();

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  List<Widget> navBarsItems(String language) {
    return [
      BottomNavigationEntry(
        label: ui_lang[language]!['home_screen_app_bar'],
        icon:
          Icons.home,
         
        index: 0,
      ),
      BottomNavigationEntry(
        label: ui_lang[language]!['vocabulary_screen_app_bar'],
        icon: 
          Icons.book,
        
        
        index: 1,
      ),
      BottomNavigationEntry(
        label: ui_lang[language]!['profile_screen_app_bar'],
        icon: Icons.person,
        index: 2,
      ),
      BottomNavigationEntry(
        label: ui_lang[language]!['settings_screen_app_bar'],
        icon: 
          Icons.settings,
         
        index: 3,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<InterfaceDataProvider>(
      builder: (context, value, child) => Container(
        height: 100,
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 6.0,
          ),
        ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: navBarsItems(value.interfaceLangauge),
            ),
          ],
        ),
      ),
    );
  }
}
