import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordy/presentation/Bloc/vocabulary/vocabulary_bloc.dart';
import 'package:wordy/presentation/widgets/flip_cards.dart';
import 'package:wordy/presentation/widgets/loading_data.dart';
import 'package:wordy/presentation/widgets/vocabulary_back_card.dart';
import 'package:wordy/presentation/widgets/vocabulary_front_card.dart';

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
            child: Container(width: 300,
          margin: const EdgeInsets.only(right: 0),
      
            child: AutoSizeText(widget.topic,minFontSize: 5,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Colors.white,),
          ),
        )),
      ),
      body: BlocBuilder<VocabularyBloc, VocabularyState>(
        builder: (context, state) {
          if (state is VocabularyFlashCards) {
            return Container(
              child: GridView.builder(
                  itemCount: state.flashCards.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) => FlipCards(
                        front: VocabularyFrontCard(
                          label: state.flashCards[index].answer,
                        ),
                        back: VocabularyBackCard(
                          label: state.flashCards[index].question,
                        ),
                      )),
            );
          } else {
            return LoadingData();
          }
        },
      ),
    );
  }
}
