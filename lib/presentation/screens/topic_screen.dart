import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordy/Utility/utility.dart';
import 'package:wordy/presentation/Bloc/topics/topics_bloc.dart';
import 'package:wordy/presentation/Widgets/topic_grid_view.dart';

import 'package:wordy/presentation/screens/topic_screen_today_statistics.dart';
import 'package:wordy/shared/consts.dart';

import '../Widgets/unexpected_error.dart';

class TopicScreen extends StatefulWidget {
  TopicScreen();
  @override
  State<TopicScreen> createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen>
    with TickerProviderStateMixin {
  final ScrollController _controller = ScrollController();

  Utility utility = Utility();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopicsBloc, TopicsState>(
      builder: (context, state) {
        if (state is TopicsInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is TopicsLoaded) {
          return GestureDetector(
            onTap: () {
              context.read<TopicsBloc>().add(ChooseSettingsForQuiz(
                  globalPosition: state.globalPosition,
                  index: state.index,
                  localPosition: state.localPosition,
                  settingsOpen: false));
            },
            child: Stack(children: [
              CustomScrollView(
                controller: _controller,
                slivers: [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    title: Center(
                        child: Text(
                      ui_lang[userLanguage]!['home_screen_app_bar'].toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: Colors.white),
                    )),
                  ),
                  SliverAppBar(
                      backgroundColor: Colors.white,
                      pinned: true,
                      floating: true,
                      title: Container(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Container(
                                height: 50,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/united-kingdom.png"))),
                              ),
                            ),
                            Expanded(
                              child: TopicScreenTodayStaticstics(
                                image: "assets/fire.png",
                                label: 0,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: TopicScreenTodayStaticstics(
                                  image: "assets/open-book.png",
                                  label: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                  TopicGridView()
                ],
              ),
              utility.quizSettings(
                  state.selectedTopic,
                  state.localPosition,
                  state.globalPosition,
                  state.index,
                  state.topics.elementAt(state.index).name,
                  context,
                  _controller),
            ]),
          );
        } else {
          return UnexpectedError();
        }
      },
    );
  }
}
