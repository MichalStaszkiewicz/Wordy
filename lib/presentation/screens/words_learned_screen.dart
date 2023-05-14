import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:wordy/presentation/provider/interface_language_provider.dart';
import 'package:wordy/presentation/widgets/statistics_list.dart';
import 'package:wordy/presentation/widgets/words_learned_choosen_language.dart';
import 'package:wordy/const/consts.dart';

import '../Bloc/user_progress/user_progress_bloc.dart';
import '../widgets/loading_data.dart';

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
              child: Consumer<InterfaceDataProvider>(
                builder: (context, value, child) => Text(
                  ui_lang[value.interfaceLangauge]!['profile_screen_learned_words']
                      .toString(),
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
      body: BlocBuilder<UserProgressBloc, UserProgressState>(
        builder: (context, state) {
          if (state is UserLearnedWordsLoaded) {
            return StatisticsList(
              image: 'assets/poland.png',
              label: 'Polish',
              navigation: WordsLearnedChoosenLanguage(
                choosenLanguage: 'Polish',
              ),
            );
          } else {
            return LoadingData();
          }
        },
      ),
    );
  }
}
