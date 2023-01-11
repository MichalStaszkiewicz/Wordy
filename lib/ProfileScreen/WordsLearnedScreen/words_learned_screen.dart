import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wordy/ProfileScreen/statistics_card.dart';
import 'package:wordy/ProfileScreen/WordsLearnedScreen/words_learned_choosen_language.dart';
import 'package:wordy/ProfileScreen/statistics_list.dart';

class WordsLearnedScreen extends StatefulWidget {
  const WordsLearnedScreen({super.key});

  @override
  State<WordsLearnedScreen> createState() => _WordsLearnedScreenState();
}

class _WordsLearnedScreenState extends State<WordsLearnedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.only(right: 40),
          child: Center(
            child: Container(
              child: Text(
                "Words Learned",
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      body: StatisticsList(image: 'assets/poland.png', label: 'Polish', navigation:  WordsLearnedChoosenLanguage(choosenLanguage: 'Polish',),),
    );
  }
}
