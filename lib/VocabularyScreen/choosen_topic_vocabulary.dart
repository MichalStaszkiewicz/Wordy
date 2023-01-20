import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wordy/VocabularyScreen/flip_cards.dart';
import 'package:wordy/VocabularyScreen/vocabulary_back_card.dart';
import 'package:wordy/VocabularyScreen/vocabulary_front_card.dart';

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
      body: Container(
        child: GridView.builder(
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) => FlipCards(
                  front: const VocabularyFrontCard(),
                  back: const VocabularyBackCard(),
                )),
      ),
    );
  }
}
