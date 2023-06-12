import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordy/const/consts.dart';

import '../bloc/profile/profile_bloc.dart';
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
              child: Text(
                ui_lang['English']!['profile_screen_learned_words'].toString(),
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileDataReady) {
            return Container(); /*
            StatisticsList(
              image: 'assets/poland.png',
              label: 'Polish',
              navigation: WordsLearnedChoosenLanguage(
                choosenLanguage: 'Polish',
              ),
            );*/
          } else {
            return const LoadingData();
          }
        },
      ),
    );
  }
}
