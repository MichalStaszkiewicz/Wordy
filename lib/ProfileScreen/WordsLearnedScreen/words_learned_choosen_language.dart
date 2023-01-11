import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wordy/ProfileScreen/statistics_card.dart';

import '../statistics_list.dart';

class WordsLearnedChoosenLanguage extends StatefulWidget {
   WordsLearnedChoosenLanguage({super.key,required this.choosenLanguage});
  String choosenLanguage;

  @override
  State<WordsLearnedChoosenLanguage> createState() =>
      _WordsLearnedChoosenLanguageState();
}

class _WordsLearnedChoosenLanguageState
    extends State<WordsLearnedChoosenLanguage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.only(right: 40),
          child: Center(
            child: Container(
              child: Text(
                "Words Learned - ${widget.choosenLanguage}",
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      body: StatisticsList(image: 'assets/dailyusage.png', label: 'Basic Conversations', navigation: null,),
    );
  }
}
