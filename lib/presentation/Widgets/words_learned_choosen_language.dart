import 'package:flutter/material.dart';
import 'package:wordy/presentation/widgets/statistics_list.dart';

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
                    .headlineSmall!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      body: StatisticsList(image: 'assets/dailyusage.png', label: 'Basic Conversation', navigation: null,),
    );
  }
}
