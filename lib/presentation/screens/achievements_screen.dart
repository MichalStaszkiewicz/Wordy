import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordy/presentation/Provider/interface_language_provider.dart';
import 'package:wordy/presentation/Widgets/achievement_item_back.dart';
import 'package:wordy/presentation/Widgets/flip_cards.dart';
import 'package:wordy/presentation/Widgets/statistics_item.dart';
import 'package:wordy/shared/consts.dart';

import '../Widgets/achievement_item_front.dart';

class AchievementsScreen extends StatefulWidget {
  const AchievementsScreen({super.key});

  @override
  State<AchievementsScreen> createState() => _AchievementsScreenState();
}

class _AchievementsScreenState extends State<AchievementsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<InterfaceDataProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Container(
            padding: const EdgeInsets.only(right: 40),
            child: Center(
              child: Container(
                child: Text(
                  ui_lang[value.interfaceLangauge]![
                      'profile_screen_achievements'],
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        body: GridView.builder(
            itemCount: 6,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) => FlipCards(
                  back: AchievementItemFront(
                    image: achievements[value.interfaceLangauge]![index]!.image,
                    name: achievements[value.interfaceLangauge]![index]!.name,
                  ),
                  front: AchievementItemBack(
                    description: achievements[value.interfaceLangauge]![index]!.description,
                 
                  ),
                )),
      ),
    );
  }
}
