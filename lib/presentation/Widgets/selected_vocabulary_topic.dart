import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/Utility/dialog_manager.dart';
import 'package:wordy/const/app_router.dart';
import 'package:wordy/presentation/Bloc/vocabulary/vocabulary_bloc.dart';
import 'package:wordy/presentation/widgets/flip_cards.dart';
import 'package:wordy/presentation/widgets/loading_data.dart';

import 'package:wordy/presentation/widgets/vocabulary_back_card.dart';
import 'package:wordy/presentation/widgets/vocabulary_front_card.dart';

import '../../data/network/exceptions/exception_helper.dart';
import '../../data/network/exceptions/unexpected_error.dart';

class SelectedVocabularyTopic extends StatefulWidget {
  SelectedVocabularyTopic({super.key, required this.topic});
  String topic;
  @override
  State<SelectedVocabularyTopic> createState() =>
      _SelectedVocabularyTopicState();
}

class _SelectedVocabularyTopicState extends State<SelectedVocabularyTopic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => VocabularyBloc()
          ..add(ListVocabularyWordsByTopic(topic: widget.topic)),
        child: BlocListener<VocabularyBloc, VocabularyState>(
          listener: (context, state) {
            if (state is VocabularyError) {
              DialogManager.showErrorDialog(state.error, context, () {
                context.go(AppRouter.vocabularyTopicScreen);
              });
            }
          },
          child: BlocBuilder<VocabularyBloc, VocabularyState>(
            builder: (context, state) {
              if (state is VocabularyFlashCards) {
                return Container(
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                    alignment: Alignment.center,
                                    child: GestureDetector(
                                        onTap: () {
                                          context.pop(
                                              AppRouter.vocabularyTopicScreen);
                                        },
                                        child: const Icon(Icons.arrow_back))),
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      widget.topic,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          child: GridView.builder(
                              itemCount: state.flashCards.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) => FlipCards(
                                    front: VocabularyFrontCard(
                                      label: state.flashCards[index].answer,
                                    ),
                                    back: VocabularyBackCard(
                                      label: state.flashCards[index].question,
                                    ),
                                  )),
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state is VocabularyError) {
                return Container();
              } else if (state is VocabularyInitial) {
                return const LoadingData();
              } else {
                DialogManager.showErrorDialog(
                    ExceptionHelper.getErrorMessage(UnexpectedError()), context,
                    () {
                  context.go(AppRouter.authScreen);
                });
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
