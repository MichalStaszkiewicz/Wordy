import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wordy/Utility/dialog_manager.dart';
import 'package:wordy/const/app_router.dart';
import 'package:wordy/data/network/exceptions/exception_helper.dart';
import 'package:wordy/data/network/exceptions/unexpected_error.dart';
import 'package:wordy/domain/logic/user_service.dart';
import 'package:wordy/presentation/Bloc/vocabulary/vocabulary_bloc.dart';
import 'package:wordy/presentation/widgets/selected_vocabulary_topic.dart';
import 'package:wordy/presentation/widgets/loading_data.dart';
import 'package:wordy/const/consts.dart';

import '../../utility/locator/api_locator.dart';

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
      body: BlocProvider(
        create: (context) => VocabularyBloc()..add(LoadVocabulary()),
        child: BlocBuilder<VocabularyBloc, VocabularyState>(
          builder: (context, state) {
            if (state is VocabularyLoaded) {
              return Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 10),
                      child: Text(
                        "Vocabulary",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
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
                            hintText: ui_lang['english']![
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
                          return GestureDetector(
                            onTap: () {
                              context.pushNamed(
                                  AppRouter.vocabularyTopicSelectedScreenNamed,
                                  queryParameters: {
                                    'topic': ui_lang['english']!['topic_label']
                                        [0]
                                  });
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
              );
            } else if (state is VocabularyError) {
              return Container();
            } else if (state is VocabularyInitial) {
              return LoadingData();
            } else {
              DialogManager.showErrorDialog(
                  ExceptionHelper.getErrorMessage(
                    UnexpectedError(),
                  ),
                  context,
                  () {});
              return Container();
            }
          },
        ),
      ),
    );
  }
}
