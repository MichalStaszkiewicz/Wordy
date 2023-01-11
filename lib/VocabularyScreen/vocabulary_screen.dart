import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordy/VocabularyScreen/choosen_topic_vocabulary.dart';
import 'package:wordy/bloc/vocabulary/vocabulary_bloc.dart';

class VocabularyScreen extends StatefulWidget {
  const VocabularyScreen({super.key});

  @override
  State<VocabularyScreen> createState() => _VocabularyScreenState();
}

class _VocabularyScreenState extends State<VocabularyScreen> {
  late TextEditingController _textEditingController;
  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Vocabulary",
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Colors.white),
          ),
        ),
      ),
      body: BlocBuilder<VocabularyBloc, VocabularyState>(
        builder: (context, state) {
          if (state is VocabularyLoaded) {
            return Container(
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 350,
                    child: Center(
                      child: TextField(
                        onChanged: (value) {
                          context
                              .read<VocabularyBloc>()
                              .add(SearchForSpecificVocabulary(text: value));
                        },
                        controller: _textEditingController,
                        decoration: InputDecoration(
                          hintText: 'Search Specific Topic',
                          hintStyle: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(letterSpacing: 1),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemCount: state.vocabularyListSearched.length,
                      itemBuilder: (context, index) {
                        final topic = state.vocabularyListSearched[index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ChoosenTopicVocabulary(
                                          topic: topic.topic,
                                        )));
                          },
                          child: Container(
                            height: 100,
                            child: Card(
                              color: const Color.fromRGBO(250, 250, 250, 1),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                        height: 60,
                                        child: const Center(
                                            child: Image(
                                                image: AssetImage(
                                                    'assets/dailyusage.png')))),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Center(
                                      child: Text(
                                        topic.topic,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Container(),
                    ),
                  ),
                ],
              ),
            );
          }
          // Other states
          return Container();
        },
      ),
    );
  }
}
