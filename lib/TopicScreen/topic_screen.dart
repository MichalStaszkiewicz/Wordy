import 'package:flutter/material.dart';
import 'package:wordy/TopicScreen/progression_bar.dart';
import 'package:wordy/TopicScreen/topic_grid_view.dart';
import 'package:wordy/TopicScreen/topic_screen_today_statistics.dart';

class TopicScreen extends StatelessWidget {
  const TopicScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Center(
              child: Text(
            "Topic",
            style: Theme.of(context).textTheme.headline5,
          )),
        ),
        SliverAppBar(
            backgroundColor: Colors.white,
            pinned: true,
            floating: true,
            title: Container(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/united-kingdom.png"))),
                    ),
                  ),
                  Expanded(
                    child: TopicScreenTodayStaticstics(
                      color: Colors.orange,
                      icon: Icons.local_fire_department_sharp,
                      label: 0,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: TopicScreenTodayStaticstics(
                        color: Colors.blueAccent,
                        icon: Icons.book,
                        label: 0,
                      ),
                    ),
                  ),
                ],
              ),
            )),
        TopicGridView(),
      ],
    );
  }
}
