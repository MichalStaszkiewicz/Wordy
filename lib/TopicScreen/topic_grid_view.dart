import 'package:flutter/material.dart';
import 'package:wordy/TopicScreen/topic_item.dart';

List<TopicItem> items = [
  TopicItem(
    color: Colors.red,
    image: 'assets/it.png',
    label: 'Information technology',
  ),
  TopicItem(
    color: Colors.blue,
    image: 'assets/dailyusage.png',
    label: 'Basic Conversation',
  ),
  TopicItem(
    color: Colors.orange,
    image: 'assets/summer.png',
    label: 'Travel',
  ),
  TopicItem(
    color: Colors.purple,
    image: 'assets/cooking-pot.png',
    label: 'Food And Cooking',
  ),
  TopicItem(
    color: Colors.red,
    image: 'assets/it.png',
    label: 'Information technology',
  ),
  TopicItem(
    color: Colors.blue,
    image: 'assets/dailyusage.png',
    label: 'Basic Conversation',
  ),
  TopicItem(
    color: Colors.orange,
    image: 'assets/summer.png',
    label: 'Travel',
  ),
  TopicItem(
    color: Colors.purple,
    image: 'assets/cooking-pot.png',
    label: 'Food And Cooking',
  ),
  TopicItem(
    color: Colors.red,
    image: 'assets/it.png',
    label: 'Information technology',
  ),
  TopicItem(
    color: Colors.blue,
    image: 'assets/dailyusage.png',
    label: 'Basic Conversation',
  ),
  TopicItem(
    color: Colors.orange,
    image: 'assets/summer.png',
    label: 'Travel',
  ),
  TopicItem(
    color: Colors.purple,
    image: 'assets/cooking-pot.png',
    label: 'Food And Cooking',
  ),
];

class TopicGridView extends StatelessWidget {
  const TopicGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return items[index];
        },
        childCount: items.length,
      ),
    );
  }
}
