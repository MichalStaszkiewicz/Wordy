import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordy/presentation/Bloc/vocabulary/vocabulary_bloc.dart';
import 'package:wordy/presentation/Widgets/flip_cards.dart';
import 'package:wordy/presentation/Widgets/vocabulary_back_card.dart';
import 'package:wordy/presentation/Widgets/vocabulary_front_card.dart';

class ChoosenTopicVocabulary extends StatefulWidget {
  ChoosenTopicVocabulary({super.key, required this.topic});
  String topic;
  @override
  State<ChoosenTopicVocabulary> createState() => _ChoosenTopicVocabularyState();
}

class _ChoosenTopicVocabularyState extends State<ChoosenTopicVocabulary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Container(
          margin: const EdgeInsets.only(right: 50),
          child: Text(widget.topic,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.white)),
        )),
      ),
      body: BlocBuilder<VocabularyBloc, VocabularyState>(
        builder: (context, state) {
          if (state is VocabularyWordiesList) {
            return Container(
              child: GridView.builder(
                  itemCount: state.questionList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) => FlipCards(
                        front: VocabularyFrontCard(
                          label: state.questionList[index].answer,
                        ),
                        back: VocabularyBackCard(
                          label: state.questionList[index].question,
                        ),
                      )),
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
