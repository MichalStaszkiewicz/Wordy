import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:wordy/presentation/Provider/interface_language_provider.dart';
import 'package:wordy/presentation/Widgets/statistics_list.dart';
import 'package:wordy/presentation/Widgets/words_learned_choosen_language.dart';
import 'package:wordy/shared/consts.dart';

import '../Bloc/user_progress/user_progress_bloc.dart';

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
              child: Consumer<InterfaceLanguageProvider>(
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
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
