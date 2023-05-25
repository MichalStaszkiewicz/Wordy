import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:wordy/presentation/Bloc/vocabulary/vocabulary_bloc.dart';
import 'package:wordy/presentation/widgets/choosen_topic_vocabulary.dart';
import 'package:wordy/presentation/widgets/loading_data.dart';
import 'package:wordy/const/consts.dart';

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
    return BlocBuilder<VocabularyBloc, VocabularyState>(
      builder: (context, state) {
        if (state is VocabularyLoaded) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              title: Text(
                ui_lang['English']!['vocabulary_screen_app_bar'].toString(),
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Colors.white),
              ),
            ),
            body: Container(
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
                          hintText: ui_lang['English']![
                                  'vocabulary_screen_search_hint']
                              .toString(),
                          hintStyle: Theme.of(context).textTheme.titleSmall,
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
                        if (state.language != 'English') {
                          context
                              .read<VocabularyBloc>()
                              .add(LoadVocabulary(language: 'English'));
                        }

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BlocProvider(
                                          create: (context) => VocabularyBloc()
                                            ..add(ListVocabularyWordsByTopic(
                                                topic: ui_lang["English"]![
                                                    'topic_label'][index])),
                                          child: ChoosenTopicVocabulary(
                                            topic: topic.topic,
                                          ),
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
                                        child: Center(
                                            child: Image(
                                                image: AssetImage(state
                                                    .vocabularyListSearched[
                                                        index]
                                                    .image)))),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Center(
                                      child: Text(
                                        state.vocabularyListSearched[index]
                                            .topic,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
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
            ),
          );
        } else {
          return Scaffold(
            body: LoadingData(),
          );
        }
      },
    );
  }
}
