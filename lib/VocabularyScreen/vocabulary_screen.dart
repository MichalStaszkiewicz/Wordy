import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wordy/VocabularyScreen/choosen_topic_vocabulary.dart';

import '../TopicScreen/progression_bar.dart';

class VocabularyScreen extends StatefulWidget {
  const VocabularyScreen({super.key});

  @override
  State<VocabularyScreen> createState() => _VocabularyScreenState();
}

class _VocabularyScreenState extends State<VocabularyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Vocabulary",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      ),
      body: Container(
        child: ListView.separated(
          itemCount: 50,
          itemBuilder: (context, index) {
            if (index == 0 || index == 49) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChoosenTopicVocabulary()));
                },
                child: Container(
                  margin: index == 0
                      ? const EdgeInsets.only(top: 20)
                      : const EdgeInsets.only(bottom: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Basic Conversation",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      ProgressionBar(
                        image: 'assets/dailyusage.png',
                        percentage: 100,
                      ),
                      Text(
                        "65 / 200",
                        style: Theme.of(context).textTheme.subtitle1,
                      )
                    ],
                  ),
                ),
              );
            } else {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChoosenTopicVocabulary()));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Basic Conversation",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    ProgressionBar(
                      image: 'assets/dailyusage.png',
                      percentage: 90,
                    ),
                    Text(
                      "65 / 200",
                      style: Theme.of(context).textTheme.subtitle1,
                    )
                  ],
                ),
              );
            }
          },
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              height: 2,
              color: const Color.fromARGB(255, 228, 227, 227),
            );
          },
        ),
      ),
    );
  }
}
