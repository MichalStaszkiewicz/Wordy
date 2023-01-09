
import 'package:flutter/material.dart';
import 'package:wordy/TopicScreen/progression_bar.dart';
import 'package:wordy/TopicScreen/topic_grid_view.dart';
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
            shadowColor: Colors.white,
            backgroundColor: Colors.white,
            pinned: true,
            title: Container(
                padding: const EdgeInsets.only(bottom: 20),
                child: ProgressionBar(image: 'assets/united-kingdom.png', percentage: 100,))),
        TopicGridView(),
      ],
    );
  }
}
