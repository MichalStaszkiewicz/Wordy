import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/Utility/dialog_manager.dart';
import 'package:wordy/Utility/locator/service_locator.dart';
import 'package:wordy/const/app_router.dart';
import 'package:wordy/const/consts.dart';
import 'package:wordy/presentation/Bloc/vocabulary/vocabulary_bloc.dart';
import 'package:wordy/presentation/widgets/card/flip_cards.dart';
import 'package:wordy/presentation/widgets/card/vocabulary_card/vocabulary_back_card.dart';
import 'package:wordy/presentation/widgets/card/vocabulary_card/vocabulary_front_card.dart';
import 'package:wordy/presentation/widgets/loading_data.dart';



import '../../data/network/exceptions/exception_helper.dart';
import '../../data/network/exceptions/unexpected_error.dart';
import '../../global/global_data_manager.dart';


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
                AppRouter.popUntil(context, AppRouter.vocabularyTopicScreen);
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
                                    child: AutoSizeText(
                                      ui_lang[locator<GlobalDataManager>()
                                                  .interfaceLanguage]![
                                              'topic_label']
                                          [widget.topic.toLowerCase()],
                                      maxLines: 1,
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
                            itemBuilder: (context, index) =>
                                AnimationConfiguration.staggeredGrid(
                                    columnCount: 2,
                                    position: index,
                                    child: ScaleAnimation(
                                      scale: 0.1,
                                      child: SlideAnimation(
                                        horizontalOffset: 50,
                                        child: FlipCards(
                                          front: VocabularyFrontCard(
                                              label: state
                                                  .flashCards[index].question),
                                          back: VocabularyBackCard(
                                            label:
                                                state.flashCards[index].answer,
                                          ),
                                        ),
                                      ),
                                    )),
                          ),
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
